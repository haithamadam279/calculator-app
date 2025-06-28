import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String text;
  Color backgroundColor;
  Color foreGroundColor;
  int flex;
  void Function(String) onPressed;

  CalculatorButton({
    required this.text,
    required this.backgroundColor,
    required this.foreGroundColor,
    required this.onPressed,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foreGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {
            onPressed(text);
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
