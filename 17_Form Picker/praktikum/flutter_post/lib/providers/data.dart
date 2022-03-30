import 'dart:io';
import 'package:flutter/material.dart';

class Data with ChangeNotifier {
  final String id;
  final File cover;
  final Color color;
  final String date;
  final String caption;

  Data({
    required this.id,
    required this.cover,
    required this.color,
    required this.date,
    required this.caption,
  });
}
