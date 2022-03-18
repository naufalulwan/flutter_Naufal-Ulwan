import 'package:flutter/material.dart';
import 'package:flutter_widget/Interface/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi widget flutter",
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}
