import 'package:bmi_calculator/caculator_brain.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/widgets/b_card_content.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/rectangle_large_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;

  int weight = 70;
  int age = 32;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          centerTitle: true,
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardColor: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "Male",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardColor: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FeMale",
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
                      child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "HEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment:
                              CrossAxisAlignment.baseline /*end*/,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              "cm",
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              thumbColor: kBottomContainerColor,
                              overlayColor:
                                  kBottomContainerColor.withOpacity(.3),
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15,
                              ),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 30,
                              )),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                height = value.toInt();
                              });
                            },
                            min: 120,
                            max: 220,
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Expanded(
                      child: BCardContent(
                        cardLabel: "WEIGHT",
                        val: weight,
                        onpressedSub: () {
                          if (weight > 1) {
                            setState(() {
                              weight--;
                            });
                          }
                        },
                        onpressedAdd: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: BCardContent(
                      cardLabel: "AGE",
                      val: age,
                      onpressedSub: () {
                        if (age > 1) {
                          setState(() {
                            age--;
                          });
                        }
                      },
                      onpressedAdd: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  )),
                ],
              ),
            ),
            RectangleLargeButton(
              title: 'CALCULATE',
              onTap: () {
                var calc = CalculatorBrain(height: height, weight: weight);
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return ResultPage(calc: calc);
                }));
              },
            ),
          ],
        ));
  }
}
