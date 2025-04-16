import 'package:calculator/Components/Buttons.dart';
import 'package:calculator/Components/Display.dart';
import 'package:calculator/Models/memory.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => CalculatorPageState();
}

class CalculatorPageState extends State<CalculatorPage> {
  final Memory memory = Memory();

  void _onPressed(String command) {
    setState(() {
      memory.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(48, 48, 48, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Display(
            expression: memory.expression,
            result: memory.value,
            isResultCalculated: memory.isResultCalculated,
          ),
          Expanded(
            child: Buttons(onPressed: _onPressed),
          ),
        ],
      ),
    );
  }
}
