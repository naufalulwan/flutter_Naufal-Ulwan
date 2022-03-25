import 'package:flutter/material.dart';
import 'package:flutter_assets/models/character.dart';
import 'package:flutter_assets/theme/color_data.dart';

class PageOne extends StatefulWidget {
  PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final id = route['id'];
    final name = route['name'];
    final imgUrl = route['imgUrl'];

    return Scaffold(
      appBar: AppBar(
        title: Text(name!),
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: 300,
        child: Image.asset(
          imgUrl,
          fit: BoxFit.fitWidth,
        ),
      )),
    );
  }
}
