import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/contact_model.dart';
import '../providers/contact_provider.dart';
import 'add_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDescending = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contact'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPage()),
              );
            },
            icon: const Icon(Icons.add),
            splashRadius: 25,
            tooltip: 'Add Contact',
          ),
        ],
      ),
      body: view(),
    );
  }

  Widget view() {
    final contact = Provider.of<ContactProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () => setState(() => isDescending = !isDescending),
          icon: Icon(
            isDescending == true ? Icons.arrow_upward : Icons.arrow_downward,
            size: 23,
          ),
          label: const Text(
            "Sort",
            style: TextStyle(fontSize: 17),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: contact.contactModels.length,
              itemBuilder: ((context, index) {
                final sortedContact = contact.contactModels
                  ..sort(
                    ((a, b) => isDescending
                        ? b.name.compareTo(a.name)
                        : a.name.compareTo(b.name)),
                  );
                final data = sortedContact[index];
                return Dismissible(
                  key: Key(data.name),
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
                                  "Are you sure you want to delete contact name ${data.name}?"),
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
                                    setState(() {
                                      contact.deleteContact(index);
                                    });
                                    Navigator.of(context).pop();
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
                      data.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(data.number),
                    leading: CircleAvatar(
                      child: Text(data.name[0]),
                    ),
                  ),
                );
              })),
        ),
      ],
    );
  }
}
