import 'package:calculator/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = '/calculator';
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resultText = '';
  String savedNumber = '';
  String savedOperator = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17181A),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  resultText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      // First Row
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CalculatorButton(
                          text: 'AC',
                          backgroundColor: Color(0xff616161),
                          foreGroundColor: Color(0xffA5A5A5),
                          onPressed: clear,
                        ),
                        SizedBox(width: 20),
                        CalculatorButton(
                          text: '<-',
                          backgroundColor: Color(0xff616161),
                          foreGroundColor: Color(0xffA5A5A5),
                          onPressed: onBackSpaceClicked,
                        ),
                        SizedBox(width: 20),
                        CalculatorButton(
                          text: '/',
                          backgroundColor: Color(0xff005DB2),
                          foreGroundColor: Color(0xff339DFF),
                          onPressed: onOperatorClicked,
                        ),
                        SizedBox(width: 20),
                        CalculatorButton(
                          text: '*',
                          backgroundColor: Color(0xff005DB2),
                          foreGroundColor: Color(0xff339DFF),
                          onPressed: onOperatorClicked,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      // Second Row
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CalculatorButton(
                          text: '7',
                          backgroundColor: Color(0xff303136),
                          foreGroundColor: Color(0xff29A8FF),
                          onPressed: onDigitClicked,
                        ),
                        SizedBox(width: 20),
                        CalculatorButton(
                          text: '8',
                          backgroundColor: Color(0xff303136),
                          foreGroundColor: Color(0xff29A8FF),
                          onPressed: onDigitClicked,
                        ),
                        SizedBox(width: 20),
                        CalculatorButton(
                          text: '9',
                          backgroundColor: Color(0xff303136),
                          foreGroundColor: Color(0xff29A8FF),
                          onPressed: onDigitClicked,
                        ),
                        SizedBox(width: 20),
                        CalculatorButton(
                          text: '-',
                          backgroundColor: Color(0xff005DB2),
                          foreGroundColor: Color(0xff339DFF),
                          onPressed: onOperatorClicked,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CalculatorButton(
                          text: '4',
                          backgroundColor: Color(0xff303136),
                          foreGroundColor: Color(0xff29A8FF),
                          onPressed: onDigitClicked,
                        ),
                        SizedBox(width: 20),
                        CalculatorButton(
                          text: '5',
                          backgroundColor: Color(0xff303136),
                          foreGroundColor: Color(0xff29A8FF),
                          onPressed: onDigitClicked,
                        ),
                        SizedBox(width: 20),
                        CalculatorButton(
                          text: '6',
                          backgroundColor: Color(0xff303136),
                          foreGroundColor: Color(0xff29A8FF),
                          onPressed: onDigitClicked,
                        ),
                        SizedBox(width: 20),
                        CalculatorButton(
                          text: '+',
                          backgroundColor: Color(0xff005DB2),
                          foreGroundColor: Color(0xff339DFF),
                          onPressed: onOperatorClicked,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    CalculatorButton(
                                      text: '1',
                                      backgroundColor: Color(0xff303136),
                                      foreGroundColor: Color(0xff29A8FF),
                                      onPressed: onDigitClicked,
                                    ),
                                    SizedBox(width: 20),
                                    CalculatorButton(
                                      text: '2',
                                      backgroundColor: Color(0xff303136),
                                      foreGroundColor: Color(0xff29A8FF),
                                      onPressed: onDigitClicked,
                                    ),
                                    SizedBox(width: 20),
                                    CalculatorButton(
                                      text: '3',
                                      backgroundColor: Color(0xff303136),
                                      foreGroundColor: Color(0xff29A8FF),
                                      onPressed: onDigitClicked,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    CalculatorButton(
                                      text: '0',
                                      backgroundColor: Color(0xff303136),
                                      foreGroundColor: Color(0xff29A8FF),
                                      flex: 5,
                                      onPressed: onDigitClicked,
                                    ),
                                    SizedBox(width: 20),
                                    CalculatorButton(
                                      text: '.',
                                      backgroundColor: Color(0xff303136),
                                      foreGroundColor: Color(0xff29A8FF),
                                      flex: 2,
                                      onPressed: onDotClicked,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        CalculatorButton(
                          text: '=',
                          backgroundColor: Color(0xff1991FF),
                          foreGroundColor: Colors.white,
                          flex: 2,
                          onPressed: onEqualClicked,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDigitClicked(String digit) {
    resultText += digit;
    setState(() {});
  }

  void onOperatorClicked(String operator) {
    if (resultText.isEmpty) return;
    if (savedNumber.isEmpty) {
      savedNumber = resultText;
    } else {
      savedNumber = calculate(savedNumber, savedOperator, resultText);
    }
    savedOperator = operator;
    resultText = '';
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    late double result;
    switch (operator) {
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num1 / num2;
        break;
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
    }
    return result.toString();
  }

  void onEqualClicked(String _) {
    if (savedNumber.isEmpty || resultText.isEmpty) return;
    resultText = calculate(savedNumber, savedOperator, resultText);
    savedNumber = '';
    savedOperator = '';
    setState(() {});
  }

  void onDotClicked(String _) {
    if (resultText.contains('.')) return;
    resultText += '.';
    setState(() {});
  }

  void onBackSpaceClicked(String _) {
    if (resultText.isEmpty) return;
    resultText = resultText.substring(0, resultText.length - 1);
    setState(() {});
  }

  void clear(String _) {
    resultText = '';
    savedNumber = '';
    savedOperator = '';
    setState(() {});
  }
}
