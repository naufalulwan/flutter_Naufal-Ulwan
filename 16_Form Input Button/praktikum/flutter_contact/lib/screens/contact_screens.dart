import 'package:flutter/material.dart';
import 'contact_item_screens.dart';
import 'contact_list_screens.dart';
import 'package:provider/provider.dart';
import 'empty_screens.dart';
import '/models/contact_manager.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contacts'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final manager = Provider.of<ContactManager>(context, listen: false);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactItemScreen(
                  onCreate: (contact) {
                    manager.addContact(contact);
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          }),
      body: buildcontactScreen(),
    );
  }

  Widget buildcontactScreen() {
    return Consumer<ContactManager>(builder: (context, manager, _) {
      if (manager.contactModels.isNotEmpty) {
        return ContactListScreen(
          manager: manager,
        );
      } else {
        return EmptyContactScreen();
      }
    });
  }
}
