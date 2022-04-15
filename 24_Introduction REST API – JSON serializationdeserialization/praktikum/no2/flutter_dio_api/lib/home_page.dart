import 'package:flutter/material.dart';
import 'package:flutter_dio_api/api_service.dart';

import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService service = ApiService();
  List<Contact> listContact = [];

  getData() async {
    listContact = await service.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Daftar Kontak',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                    itemCount: listContact.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(listContact[index].name),
                        subtitle: Text(listContact[index].phone),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
