import 'package:provider/provider.dart';

import '../Model/contact_model.dart';
import 'package:flutter/material.dart';

import '../Providers/contact_provider.dart';

class ListedView extends StatefulWidget {
  final Contact contact;

  ListedView(this.contact) : super();

  @override
  _ListedViewState createState() => _ListedViewState();
}

class _ListedViewState extends State<ListedView> {
  void onRemove(contact) {
    Provider.of<ContactProvider>(context, listen: false).deleteContact(contact);
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(
        widget.contact.name,
      ),
      direction: DismissDirection.startToEnd,
      secondaryBackground: Container(),
      background: Container(
          color: Colors.red,
          child: Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                Text(
                  " Delete",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            alignment: Alignment.centerLeft,
          )),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          final bool rest = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text(
                      "Are you sure you want to delete contact name ${widget.contact.name}?"),
                  actions: <Widget>[
                    TextButton(
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        onRemove(widget.contact);
                      },
                    ),
                  ],
                );
              });
          return rest;
        }
      },
      child: ListTile(
        title: Text(
          widget.contact.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(widget.contact.numberPhone),
        leading: CircleAvatar(
          child: Text(widget.contact.name[0]),
        ),
      ),
    );
  }
}
