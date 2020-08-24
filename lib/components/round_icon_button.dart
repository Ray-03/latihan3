import 'package:flutter/material.dart';

import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, this.onTap});
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      child: Icon(icon),
      elevation: 0.6,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: kIconButton,
    );
  }
}
