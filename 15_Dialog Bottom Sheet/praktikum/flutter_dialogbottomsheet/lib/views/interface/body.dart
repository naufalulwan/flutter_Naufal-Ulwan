import 'package:flutter/material.dart';
import 'package:flutter_dialogbottomsheet/themes/color.dart';
import 'components/grid.dart';
import 'components/header.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Palette.whiteCloud),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: const [
              Header(),
              Grid(),
            ],
          ),
        ),
      ),
    );
  }
}
