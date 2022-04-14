import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  Input({
    Key? key,
    this.obscureText = false,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.errorText,
    required this.keyboardType,
  }) : super(key: key);

  TextEditingController controller;
  bool obscureText;
  String hintText;
  String labelText;
  String? errorText;
  TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black26),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
