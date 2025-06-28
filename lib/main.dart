import 'package:calculator/calculator_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  CalculatorScreen.routeName: (context) => CalculatorScreen(),
};
void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {CalculatorScreen.routeName: (_) => CalculatorScreen()},
      initialRoute: CalculatorScreen.routeName,
    );
  }
}
