import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sql/bloc/contact_bloc.dart';
import 'package:flutter_sql/bloc/contact_event.dart';
import 'package:flutter_sql/databases/contact_database.dart';

import '../models/contact_model.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _phoneNumber.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey();

  Widget _buildName() {
    return TextFormField(
      controller: _name,
      decoration: const InputDecoration(
        labelText: 'Nama kontak',
        hintText: 'Masukan nama kontak',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      maxLength: 100,
      validator: (_) {
        if (_name.value.text.isEmpty) {
          return 'Nama harus diisi';
        }
        return null;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      controller: _phoneNumber,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Nomor Telepon',
        hintText: 'Masukan nomor telepon',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      maxLength: 13,
      validator: (_) {
        if (_phoneNumber.value.text.isEmpty) {
          return 'Nomor harus diisi';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Contact")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                _buildName(),
                const SizedBox(
                  height: 10,
                ),
                _buildPhoneNumber(),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: const Text(
                      'Submit',
                    ),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _formKey.currentState!.save();
                      Contact contact = Contact(
                          name: _name.text, phoneNumber: _phoneNumber.text);
                      ContactDatabase.db.insert(contact).then((value) =>
                          BlocProvider.of<ContactBloc>(context)
                              .add(AddContact(value)));
                      Navigator.pop(context);
                    })
              ],
            )),
      ),
    );
  }
}
