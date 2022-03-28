import 'package:flutter/material.dart';
import '/models/contact_manager.dart';
import '/screens/contact_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter contact',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ContactScreen(),
      ),
    );
  }
}
