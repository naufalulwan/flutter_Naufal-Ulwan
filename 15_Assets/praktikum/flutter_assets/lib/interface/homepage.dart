import 'package:flutter/material.dart';
import 'package:flutter_assets/models/character.dart';
import 'package:flutter_assets/interface/page.dart';
import 'grid.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Assets'),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: GridView(
          shrinkWrap: true,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          children: chara
              .map((char) => Grid(char.id, char.name, char.imgUrl))
              .toList(),
        ),
      ),
    );
  }
}
