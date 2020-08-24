import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/components/calculate_button.dart';
import 'package:my_bmi_calculator/components/reusable_card.dart';

import '../constants.dart';

class ResultPage extends StatelessWidget {
//  static const routeName = '/resultPage';
  ResultPage({this.bmi, this.desc, this.interpret});
  final String bmi;
  final String desc;
  final String interpret;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('BMI Calculator'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Your BMI Result',
                    style: kTextStyleButton,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: ReusableCard(
                  color: kReusableActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        desc,
                        style:
                            desc == 'NORMAL' ? kGoodTextStyle : kAvgTextStyle,
                      ),
                      Text(
                        bmi,
                        style: kBMIStyle,
                      ),
                      Text(
                        interpret,
                        style: TextStyle(
                          fontSize: 22.0,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              CalculateButton(
                label: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )),
    );
  }
}
