import 'package:flutter_shared_preferences/widgets/button.dart';

import '../Model/contact_model.dart';
import '../Providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/text_field.dart';

class AddCardPage extends StatefulWidget {
  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _contactNumController = TextEditingController();

  void onAdd() {
    Contact contacts = Contact(
      name: _contactNameController.text,
      numberPhone: _contactNumController.text,
    );
    Provider.of<ContactProvider>(context, listen: false).addContact(contacts);
    Navigator.of(context).pop(true);
  }

  @override
  void initState() {
    super.initState();
    _contactNameController.addListener(() {
      setState(() {});
    });

    _contactNumController.addListener(() {
      setState(() {});
    });
  }

  String? get _errorTextName {
    final textName = _contactNameController.value.text;
    if (textName.isEmpty) {
      return 'Cant be empty';
    }
    return null;
  }

  String? get _errorTextNum {
    final textNum = _contactNumController.value.text;
    if (textNum.isEmpty) {
      return 'Cant be empty';
    }
    return null;
  }

  bool _submitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Add Contact",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black45,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildTextField(),
            const SizedBox(
              height: 20,
            ),
            buildButton()
          ],
        ),
      ),
    );
  }

  Widget buildTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Input(
          controller: _contactNameController,
          hintText: 'Please enter contact name',
          labelText: 'Name Contact',
          errorText: _submitted ? _errorTextName : null,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),
        Input(
          controller: _contactNumController,
          hintText: 'Please enter contact number',
          labelText: 'Number Contact',
          errorText: _submitted ? _errorTextNum : null,
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }

  Widget buildButton() {
    return ButtonInput(
      child: const Text('Submit'),
      onPressed: _contactNameController.value.text.isNotEmpty &&
              _contactNumController.value.text.isNotEmpty
          ? _submit
          : null,
    );
  }

  void _submit() {
    setState(() => _submitted = true);

    if (_errorTextName == null && _errorTextNum == null) {
      onAdd();
    }
  }
}
