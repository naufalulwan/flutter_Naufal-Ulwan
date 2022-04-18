import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_nvvm/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../blocs/user_detail_bloc.dart';
import 'user_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final _provider = Provider.of<UserProvider>(context, listen: false);
      _provider.fetchUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List of User',
        ),
      ),
      body: Consumer<UserProvider>(
        builder: ((context, ofUser, _) {
          if (ofUser.users == null) {
            return const Center(child: Text('Datanya masih kosong!'));
          } else {
            print(ofUser.users!.data);
            return ListView.builder(
                itemCount: ofUser.users!.data!.length,
                itemBuilder: (context, index) {
                  final user = ofUser.users!.data![index];

                  return ListTile(
                    leading: Image.network(user.avatar!),
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.email!),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => UserDetailBloc(),
                          child: UserDetailScreen(id: user.id.toString()),
                        ),
                      ),
                    ),
                  );
                });
          }
        }),
      ),
    );
  }
}
