import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  const CalcButton({
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: onTap,
        child: Container(
          height: 72,
          width: 72,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(fontSize: 26, color: textColor),
          ),
        ),
      ),
    );
  }
}
