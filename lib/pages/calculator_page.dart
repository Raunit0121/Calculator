import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../widgets/calc_button.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String displayText = '0';

  void onButtonPressed(String text) {
    setState(() {
      if (text == 'AC') {
        displayText = '0';
      } else if (text == '⌫') {
        displayText = displayText.length > 1
            ? displayText.substring(0, displayText.length - 1)
            : '0';
      } else if (text == '=') {
        try {
          displayText = _calculate(displayText);
        } catch (e) {
          displayText = 'Error';
        }
      } else {
        if (displayText == '0') {
          displayText = text;
        } else {
          displayText += text;
        }
      }
    });
  }

  String _calculate(String input) {
    input = input.replaceAll('×', '*').replaceAll('÷', '/');
    Parser p = Parser();
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    return eval.toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '');
  }

  @override
  Widget build(BuildContext context) {
    final buttonLabels = [
      'AC', '%', '⌫', '÷',
      '7', '8', '9', '×',
      '4', '5', '6', '-',
      '1', '2', '3', '+',
      '00', '0', '.', '='
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Text(
              displayText,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.w300),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(16),
            itemCount: buttonLabels.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final label = buttonLabels[index];
              final isOperator = '÷×-+=AC%⌫'.contains(label);
              final isEquals = label == '=';

              return CalcButton(
                text: label,
                color: isEquals
                    ? Colors.orange
                    : isOperator
                    ? Colors.grey[300]!
                    : Colors.white,
                textColor:
                isEquals ? Colors.white : (isOperator ? Colors.black87 : Colors.black),
                onTap: () => onButtonPressed(label),
              );
            },
          ),
        ],
      ),
    );
  }
}
