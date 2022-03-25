import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_assets/models/character.dart';
import 'package:flutter_assets/interface/page.dart';

class Grid extends StatelessWidget {
  final int id;
  final String name;
  final String imgUrl;

  Grid(this.id, this.name, this.imgUrl);

  void goToPageOne(BuildContext context) {
    Navigator.of(context).pushNamed('/pageone',
        arguments: {'id': id, 'name': name, 'imgUrl': imgUrl});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToPageOne(context),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
