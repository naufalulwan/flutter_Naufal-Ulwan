import 'package:flutter/material.dart';
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
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: const Text('Contact Name'),
        ),
        TextField(
          controller: _contactNameController,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            hintText: 'Masukan nama contact',
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
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: const Text('Contact Telepon'),
        ),
        TextField(
          keyboardType: TextInputType.phone,
          controller: _contactTelpController,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            hintText: 'Masukan Nomor telepon',
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
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      child: const Text('Submit'),
      onPressed: () {
        final contactItem = ContactModel(
          id: const Uuid().v1(),
          contactName: _contactNameController.text,
          contactTelp: _contactTelpController.text,
        );
        widget.onCreate(contactItem);
      },
    );
  }
}
