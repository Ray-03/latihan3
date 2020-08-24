import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bmi_calculator/components/calculate_button.dart';
import 'package:my_bmi_calculator/components/icon_content.dart';
import 'package:my_bmi_calculator/components/reusable_card.dart';
import 'package:my_bmi_calculator/components/round_icon_button.dart';
import 'package:my_bmi_calculator/constants.dart';
import 'package:my_bmi_calculator/pages/result_page.dart';

import '../calculator_brain.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType gender;
  int bodyHeight = 165;
  int bodyWeight = 60;
  int age = 17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: gender == GenderType.male
                        ? kReusableActiveCardColour
                        : kReusableInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                    onTap: () {
                      setState(() {
                        gender = GenderType.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: gender == GenderType.female
                        ? kReusableActiveCardColour
                        : kReusableInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                    onTap: () {
                      setState(() {
                        gender = GenderType.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kReusableActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyleSubtitle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        bodyHeight.toString(),
                        style: kTextStyleNumber,
                      ),
                      Text(
                        'CM',
                        style: kTextStyleSubtitle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: kPink,
                      overlayColor: kPink.withAlpha(50),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kGray,
                    ),
                    child: Slider(
                      value: bodyHeight.toDouble(),
                      onChanged: (double newHeight) {
                        setState(() {
                          bodyHeight = newHeight.round();
                        });
                      },
                      min: 120,
                      max: 190,
//                      activeColor: kPink,
//                      inactiveColor: kGray,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kReusableActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyleSubtitle,
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              bodyWeight.toString(),
                              style: kTextStyleNumber,
                            ),
                            Text(
                              'KG',
                              style: kTextStyleSubtitle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  if (bodyWeight > 20) bodyWeight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  bodyWeight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kReusableActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyleSubtitle,
                        ),
                        Text(
                          age.toString(),
                          style: kTextStyleNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  if (age > 10) age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            label: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                  height: bodyHeight.toDouble(), weight: bodyWeight.toDouble());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: calc.getBmi().toStringAsFixed(1),
                    desc: calc.getResult(),
                    interpret: calc.getInterpret(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
