import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => InputPage(),
//        ResultPage.routeName: (context) => ResultPage(),
      },
      initialRoute: '/',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0C1234),
        scaffoldBackgroundColor: Color(0xff0C1234),
      ),
//      home: InputPage(),
    );
  }
}
