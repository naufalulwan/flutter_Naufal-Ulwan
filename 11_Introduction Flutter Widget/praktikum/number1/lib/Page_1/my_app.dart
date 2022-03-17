import 'package:flutter/material.dart';
import 'package:number1/Page_1/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tugas Flutter',
      home: HomePage(
        title: "Widget Flutter",
        background: Colors.purple,
      ),
    );
  }
}
