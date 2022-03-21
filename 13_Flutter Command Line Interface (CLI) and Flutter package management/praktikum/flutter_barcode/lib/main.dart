import 'package:flutter/material.dart';
import 'presentation/home_pagel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode package flutter',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: HomePage(),
    );
  }
}
