import 'package:flutter/material.dart';
import 'package:flutter_dialogbottomsheet/themes/color.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        width: 350,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: coloring(Palette.whiteCloud),
          image: const DecorationImage(
              image: AssetImage('assets/img/all.jpg'),
              fit: BoxFit.cover,
              opacity: 0.5),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            highlightColor: coloring(Palette.secondary).withOpacity(0.2),
            splashColor: coloring(Palette.primary).withOpacity(0.35),
            child: const Image(
              image: AssetImage('assets/img/twice.png'),
            ),
            onLongPress: () {},
          ),
        ),
      ),
    );
  }
}
