import 'package:bmi_calculator/caculator_brain.dart';
import 'package:bmi_calculator/widgets/rectangle_large_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'input_page.dart';

class ResultPage extends StatefulWidget {
  final CalculatorBrain calc;

  ResultPage({required this.calc});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String resultText = "";

  String resultNumber = "";

  String resultInterpretation = "";

  @override
  void initState() {
    setState(() {
      resultText = widget.calc.getResult();
      resultNumber = widget.calc.calculateBMI();
      resultInterpretation = widget.calc.getInterpretation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Your Result ,",
                    style: kTitleTextStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardColor: kInActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            resultText.toUpperCase(),
                            style: kLabelTextStyle.copyWith(
                                letterSpacing: 2,
                                fontSize: 22.0,
                                color: Color(0xFF24D876)),
                          ),
                          Text(
                            resultNumber,
                            style: kTitleTextStyle.copyWith(fontSize: 100),
                          ),
                          Text(
                            resultInterpretation,
                            style: kLabelTextStyle,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: RectangleLargeButton(
                    title: 'RE-CALCULATE',
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return InputPage();
                      }));
                    },
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
