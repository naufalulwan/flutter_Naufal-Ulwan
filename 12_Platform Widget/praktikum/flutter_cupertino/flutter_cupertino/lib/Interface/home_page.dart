import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Align(
          widthFactor: 1.0,
          alignment: Alignment.center,
          child: Text('Edit'),
        ),
        middle: Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Align(
          widthFactor: 1.0,
          alignment: Alignment.center,
          child: Icon(
            Icons.ios_share,
            size: 25,
          ),
        ),
      ),
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              CupertinoSearchTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
