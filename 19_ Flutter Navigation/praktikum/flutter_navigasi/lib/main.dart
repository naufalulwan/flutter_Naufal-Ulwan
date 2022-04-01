import 'package:flutter/material.dart';
import './screens/create_contact_screen.dart';
import './screens/contact_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigasi',
      home: ContactScreen(),
    );
  }
}
