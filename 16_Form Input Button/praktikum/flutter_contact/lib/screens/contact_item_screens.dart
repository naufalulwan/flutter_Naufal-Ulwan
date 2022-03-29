import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import '/models/contact_models.dart';

class ContactItemScreen extends StatefulWidget {
  const ContactItemScreen({Key? key, required this.onCreate}) : super(key: key);
  final Function(ContactModel) onCreate;

  @override
  State<ContactItemScreen> createState() => _ContactItemScreenState();
}

class _ContactItemScreenState extends State<ContactItemScreen> {
  final _contactNameController = TextEditingController();
  final _contactTelpController = TextEditingController();
  String _contactName = '';
  String _contactTelp = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contactNameController.addListener(() {
      setState(() {
        _contactName = _contactNameController.text;
      });
    });

    _contactTelpController.addListener(() {
      setState(() {
        _contactTelp = _contactTelpController.text;
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

  String? get _errorTextTelp {
    final textTelp = _contactTelpController.value.text;
    if (textTelp.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  bool _submitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            builNameField(),
            const SizedBox(
              height: 20,
            ),
            buildButton()
          ],
        ),
      ),
    );
  }

  Widget builNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _contactNameController,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            labelText: 'Name Contact',
            errorText: _submitted ? _errorTextName : null,
            hintText: 'please enter contact name',
            enabledBorder: const OutlineInputBorder(
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
          keyboardType: TextInputType.phone,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(
                RegExp(r'[0-9, +, *, #, ., (), /]'))
          ],
          controller: _contactTelpController,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            labelText: 'Number Telepon',
            errorText: _submitted ? _errorTextTelp : null,
            hintText: 'Please enter number',
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    return ElevatedButton(
        child: const Text('Submit'),
        onPressed: _contactNameController.value.text.isNotEmpty &&
                _contactTelpController.value.text.isNotEmpty
            ? _submit
            : null);
  }

  void _submit() {
    setState(() => _submitted = true);
    if (_errorTextName == null && _errorTextTelp == null) {
      final contactItem = ContactModel(
        id: const Uuid().v1(),
        contactName: _contactNameController.text,
        contactTelp: _contactTelpController.text,
      );
      widget.onCreate(contactItem);
    }
  }
}
