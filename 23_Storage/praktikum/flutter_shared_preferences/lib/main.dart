import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/Pages/login_page.dart';
import 'package:provider/provider.dart';
import '../Providers/contact_provider.dart';
import '../Pages/home_page.dart';

void main() => runApp(ChangeNotifierProvider<ContactProvider>(
    create: (context) => ContactProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: LoginPage(),
    )));
