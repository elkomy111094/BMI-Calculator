import 'package:bmi_calculator/pages/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

//BMI Class
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      /* initialRoute: "input_page",
      routes: {
        "input_page": (context) => InputPage(),
        "result_page": (context) => ResultPage(),
      },*/
      home: InputPage(),
    );
  }
}
