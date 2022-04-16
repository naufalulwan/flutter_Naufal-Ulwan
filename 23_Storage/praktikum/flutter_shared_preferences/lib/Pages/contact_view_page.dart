import '../Model/contact_model.dart';
import '../Providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactViewPage extends StatefulWidget {
  final Contact contact;

  const ContactViewPage({Key? key, required this.contact}) : super(key: key);

  @override
  _ContactViewPageState createState() => _ContactViewPageState();
}

class _ContactViewPageState extends State<ContactViewPage> {
  void onRemove(contact) {
    Provider.of<ContactProvider>(context, listen: false).deleteContact(contact);
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        title: const Text(
          "Contact List",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(238, 241, 242, 1),
        elevation: 0,
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.black45,
            ),
            onPressed: () {
              onRemove(widget.contact);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(children: [
            CircleAvatar(
              radius: 50,
              child: Text(
                widget.contact.name[0],
                style: const TextStyle(fontSize: 50),
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Text(
                widget.contact.name,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              width: 350,
              color: Colors.black26,
            ),
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Icon(
                      Icons.call,
                      size: 30,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        'Number Phone',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        widget.contact.numberPhone,
                        style: const TextStyle(fontSize: 17, letterSpacing: 1),
                      ),
                    ),
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
