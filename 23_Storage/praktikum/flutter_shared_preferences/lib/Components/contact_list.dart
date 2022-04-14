import 'contact_view.dart';
import '../Model/contact_model.dart';
import '../Pages/contact_view_page.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts;

  const ContactList({Key? key, required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: getChildren(context));
  }

  List<Widget> getChildren(context) {
    return contacts
        .map((contact) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactViewPage(contact: contact),
                  ),
                );
              },
              child: ListedView(contact),
            ))
        .toList();
  }
}
