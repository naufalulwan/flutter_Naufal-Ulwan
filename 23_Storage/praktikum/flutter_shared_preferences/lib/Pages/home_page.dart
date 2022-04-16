import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/Pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_beautiful_popup/main.dart';

import '../Providers/contact_provider.dart';
import '../Components/contact_list.dart';
import './contact_add_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences loginData;
  String email = '';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      email = loginData.getString('email').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        title: const Text(
          "Contact",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(238, 241, 242, 1),
        elevation: 0,
        leading: null,
        actions: <Widget>[
          // Consumer<ContactProvider>(
          //   builder: (context, contacts, _) => IconButton(
          //     icon: const Icon(
          //       Icons.delete_sweep,
          //       color: Colors.black45,
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
          IconButton(
            splashRadius: 25,
            icon: const Icon(
              Icons.account_circle,
              color: Colors.black45,
            ),
            onPressed: () {
              final popup = BeautifulPopup(
                context: context,
                template: TemplateSuccess,
              );
              popup.show(
                title: 'Welcome, ${email}',
                content: '',
                actions: [
                  popup.button(
                    label: 'Logout',
                    onPressed: () {
                      loginData.setBool('login', true);
                      loginData.remove('email');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoginPage())));
                    },
                  ),
                ],
                // bool barrierDismissible = false,
                // Widget close,
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Consumer<ContactProvider>(
          builder: (context, contacts, _) => ContactList(
            contacts: contacts.allContact,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddContactPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
