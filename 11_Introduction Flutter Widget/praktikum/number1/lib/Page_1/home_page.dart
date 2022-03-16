import 'package:flutter/material.dart';
import 'dart:async';

import 'package:number1/Page_1/clock.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Clock(),
      ),
    );
  }
}
