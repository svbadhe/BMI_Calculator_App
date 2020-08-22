import 'package:flutter/material.dart';
import 'input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        primaryColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(textTheme: TextTheme(title: TextStyle(color: Colors.grey[400], fontSize: 20))),
        textTheme: TextTheme(body1: TextStyle(color: Colors.white, fontSize: 20,)),
      ),
      home: SafeArea(child: InputPage()),
    );
  }
}
