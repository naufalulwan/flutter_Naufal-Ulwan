import 'package:flutter/material.dart';

class ButtonInput extends StatelessWidget {
  ButtonInput({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  Widget child;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
