import 'package:flutter/material.dart';
import '/components/contact_item_card.dart';
import '/models/contact_manager.dart';

class ContactListScreen extends StatelessWidget {
  final ContactManager manager;
  const ContactListScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactItem = manager.contactModels;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: contactItem.length,
        itemBuilder: (context, index) {
          final item = contactItem[index];
          return ContactItemCard(
            key: Key(item.id),
            contact: item,
            onPressed: () {
              manager.deleteContact(index);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${item.contactName} Deleted'),
              ));
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
      ),
    );
  }
}
