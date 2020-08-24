import 'package:flutter/material.dart';

import '../constants.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({this.label, this.onTap});
  final String label;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kPink,
        padding: EdgeInsets.only(bottom: 10.0),
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomButtonHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: kTextStyleButton,
          ),
        ),
      ),
    );
  }
}
