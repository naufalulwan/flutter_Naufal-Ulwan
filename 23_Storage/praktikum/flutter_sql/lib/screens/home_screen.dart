import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sql/databases/contact_database.dart';

import '../bloc/contact_bloc.dart';
import '../bloc/contact_event.dart';
import '../bloc/theme/theme_bloc.dart';
import '../models/contact_model.dart';
import './add_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ContactDatabase.db.getContacts().then(
      (element) {
        BlocProvider.of<ContactBloc>(context).add(SetContact(element));
      },
    );
  }

  bool isDescending = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Daftar Kontak'),
        leading: IconButton(
          onPressed: () => context.read<ThemeBloc>().changeTheme(),
          icon: Icon(Icons.invert_colors),
          splashRadius: 25,
          tooltip: 'Ganti tema',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddScreen()),
              );
            },
            icon: const Icon(Icons.add),
            splashRadius: 25,
            tooltip: 'Tambahkan kontak',
          ),
        ],
      ),
      body: view(),
    );
  }

  Widget view() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () => setState(() => isDescending = !isDescending),
          icon: Icon(
            isDescending == true ? Icons.arrow_upward : Icons.arrow_downward,
            size: 23,
          ),
          label: const Text(
            "Urutkan",
            style: TextStyle(fontSize: 17),
          ),
        ),
        Expanded(
          child: BlocConsumer<ContactBloc, List<Contact>>(
            builder: (context, contactList) {
              return ListView.builder(
                  itemCount: contactList.length,
                  itemBuilder: ((context, index) {
                    print('Contact List : $contactList');
                    final sortedContact = contactList
                      ..sort(
                        ((a, b) => isDescending
                            ? b.name.compareTo(a.name)
                            : a.name.compareTo(b.name)),
                      );
                    Contact data = sortedContact[index];
                    return Dismissible(
                      key: Key(data.name),
                      direction: DismissDirection.startToEnd,
                      secondaryBackground: Container(),
                      background: Container(
                          color: Colors.red,
                          child: Align(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                Text(
                                  " Hapus",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                            alignment: Alignment.centerLeft,
                          )),
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          final bool rest = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                      "Apakah anda yakin ingin menghapus ${data.name} dari daftar kontak ?"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        "Batal",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text(
                                        "Hapus",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      onPressed: () {
                                        ContactDatabase.db
                                            .delete(data.id!)
                                            .then((_) {
                                          BlocProvider.of<ContactBloc>(context)
                                              .add(DeleteContact(index));
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                          return rest;
                        }
                      },
                      child: ListTile(
                        title: Text(
                          data.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(data.phoneNumber),
                        leading: CircleAvatar(
                          child: Text(data.name[0]),
                        ),
                      ),
                    );
                  }));
            },
            listener: (context, contactList) {},
          ),
        ),
      ],
    );
  }
}
