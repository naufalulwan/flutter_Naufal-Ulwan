import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/contact/contact_bloc.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool isDescending = false;
  @override
  Widget build(BuildContext context) {
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
          child: BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              if (state is ContactLoaded) {
                return ListView.builder(
                    itemCount: state.contact.length,
                    itemBuilder: ((context, index) {
                      final sortedContact = state.contact
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
                                          context.read<ContactBloc>().add(
                                              OnDeletedContact(contact: data));
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
                    }));
              } else {
                return const Center(child: Text(""));
              }
            },
          ),
        ),
      ],
    );
    ;
  }
}
