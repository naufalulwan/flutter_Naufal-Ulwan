import 'package:flutter/material.dart';
import 'interface/appbar.dart';
import 'interface/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Appbar(),
        ),
        body: Body());
    ;
  }
}
