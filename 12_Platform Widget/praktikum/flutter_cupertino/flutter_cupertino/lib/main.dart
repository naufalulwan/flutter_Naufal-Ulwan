import 'package:flutter/cupertino.dart';
import 'Interface/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Cupertino App',
      home: HomePage(),
    );
  }
}
