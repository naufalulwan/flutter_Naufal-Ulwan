import 'package:flutter/material.dart';
import 'dart:async';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);
  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  var time = 'Hello world';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        time,
        style: TextStyle(
          fontSize: 42,
        ),
      ),
    );
  }

  startTime() {
    Timer.periodic(const Duration(seconds: 1), (_) {
      var now = DateTime.now();
      var formatedTime =
          "${now.hour.toString()}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
      setState(() {
        time = formatedTime;
      });
    });
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }
}
