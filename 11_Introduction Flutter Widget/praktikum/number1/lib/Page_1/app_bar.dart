import 'package:flutter/material.dart';
import 'package:number1/page_1/home_page.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
    required this.title,
    required this.background,
  }) : super(key: key);
  final Color background;
  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: background,
        ),
        body: HomePage(),
      ),
    );
  }
}
