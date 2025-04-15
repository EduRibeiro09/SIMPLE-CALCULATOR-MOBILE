import 'package:calculator/Components/Buttons.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) onPressed;

  const Keyboard({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.black,
        child: Buttons(onPressed: onPressed),
      ),
    );
  }
}
