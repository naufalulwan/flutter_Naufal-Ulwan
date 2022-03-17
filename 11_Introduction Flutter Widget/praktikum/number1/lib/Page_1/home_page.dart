import 'package:flutter/material.dart';
import 'dart:async';

import 'package:number1/Page_1/clock.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.title,
    required this.background,
  }) : super(key: key);
  final Color background;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: background,
      ),
      body: Center(
        child: Clock(),
      ),
    );
  }
}
