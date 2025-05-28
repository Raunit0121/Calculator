import 'package:calculator/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'pages/calculator_page.dart';

void main() => runApp(MyCalculatorApp());

class MyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Splashscreen(),
    );
  }
}
