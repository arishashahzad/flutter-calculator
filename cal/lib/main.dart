import 'package:cal/calculator_screen.dart';

import 'package:flutter/material.dart';
void main() {
  runApp(IosCalculator());
}

class IosCalculator extends StatelessWidget {
  const IosCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (CalculatorScreen()),
    );
  }
}