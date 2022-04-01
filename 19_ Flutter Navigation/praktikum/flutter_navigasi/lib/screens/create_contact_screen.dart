import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_navigasi/models/data.dart';

class CreateContactScreen extends StatefulWidget {
  const CreateContactScreen({Key? key}) : super(key: key);
  static const nameRoute = '/createContact';

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _telpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: ListView(
        children: [
          builNameField(context),
          const SizedBox(
            height: 20,
          ),
          buildButton()
        ],
      ),
    );
  }

  Widget builNameField(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _nameController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              labelText: 'Name Contact',
              hintText: 'please enter contact name',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _telpController,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9, +, *, #, ., (), /]'))
            ],
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              labelText: 'Number Telepon',
              hintText: 'Please enter number',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
        child: const Text('Submit'),
        onPressed: () {
          Navigator.pop(context);

          listUser.add(
            User(name: _nameController.text, telp: _telpController.text),
          );
        },
      ),
    );
  }
}
