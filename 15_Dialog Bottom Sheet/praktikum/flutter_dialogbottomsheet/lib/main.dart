import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'themes/color.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dialog BottomSheet',
      theme: ThemeData(
        primarySwatch: coloring(Palette.primary),
      ),
      home: const HomePage(),
    );
  }
}
