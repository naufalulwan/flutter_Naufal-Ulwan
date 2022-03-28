import 'package:flutter/material.dart';
import 'package:flutter_dialogbottomsheet/themes/color.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Twice',
              style: TextStyle(
                fontFamily: 'Lobster',
                fontSize: 35,
              ),
            ),
            TextSpan(
              text: ' Gallery',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: <Color>[
              coloring(Palette.primary),
              coloring(Palette.secondary)
            ],
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
    ;
  }
}
