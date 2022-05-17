import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input(
      {Key? key,
      this.obscureText = false,
      this.controller,
      this.hintText,
      this.labelText,
      this.errorText,
      this.keyboardType,
      this.onSaved,
      this.validator,
      this.icon})
      : super(key: key);

  TextEditingController? controller;
  bool obscureText;
  String? hintText;
  String? labelText;
  String? errorText;
  TextInputType? keyboardType;
  Function(String?)? onSaved;
  String? Function(String?)? validator;
  Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        hintText: hintText,
        prefixIcon: icon,
        contentPadding: EdgeInsets.zero,
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
