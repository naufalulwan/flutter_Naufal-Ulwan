import 'package:flutter/material.dart';
import 'package:number1/Page_1/app_bar.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tugas Flutter',
      home: Appbar(
        title: "Widget Flutter",
        background: Colors.blue,
      ),
    );
  }
}
