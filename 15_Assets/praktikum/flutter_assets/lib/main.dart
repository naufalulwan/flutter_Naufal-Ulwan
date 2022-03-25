import 'package:flutter/material.dart';
import 'package:flutter_assets/interface/page.dart';

// Class
import 'package:flutter_assets/theme/color_data.dart';
import 'interface/homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assets',
      theme: ThemeData(primarySwatch: generateColor(Palette.primary)),
      routes: {
        '/': (ctx) => HomePage(),
        '/pageone': (ctx) => PageOne(),
      },
    );
  }
}
