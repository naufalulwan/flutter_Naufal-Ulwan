import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/contact_model.dart';
import '../providers/contact_provider.dart';
import '../widgets/button.dart';
import '../widgets/input.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _contactNameController = TextEditingController();
  final _contactNumController = TextEditingController();

  String _contactName = '';
  String _contactNum = '';

  @override
  void initState() {
    super.initState();
    _contactNameController.addListener(() {
      setState(() {
        _contactName = _contactNameController.text;
      });
    });

    _contactNumController.addListener(() {
      setState(() {
        _contactNum = _contactNumController.text;
      });
    });
  }

  String? get _errorTextName {
    final textName = _contactNameController.value.text;
    if (textName.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  String? get _errorTextNum {
    final textNum = _contactNumController.value.text;
    if (textNum.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  bool _submitted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
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
        MyTextField(
          controller: _contactNameController,
          hintText: 'Please enter contact name',
          labelText: 'Name Contact',
          errorText: _submitted ? _errorTextName : null,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),
        MyTextField(
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
    return MyButton(
      child: const Text('Submit'),
      onPressed: _contactNameController.value.text.isNotEmpty &&
              _contactNumController.value.text.isNotEmpty
          ? _submit
          : null,
    );
  }

  void _submit() {
    setState(() => _submitted = true);

    final contact = Provider.of<ContactProvider>(context, listen: false);
    if (_errorTextName == null && _errorTextNum == null) {
      contact.addContact(Contact(
          name: _contactNameController.text,
          number: _contactNumController.text));
      Navigator.pop(context);
    }
  }
}
