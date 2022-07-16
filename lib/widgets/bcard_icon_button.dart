import 'package:flutter/material.dart';

import '../constants.dart';

class BCardIconButton extends StatelessWidget {
  final void Function() iconButtonPress;
  final IconData iconButtonIcon;

  BCardIconButton(
      {required this.iconButtonIcon, required this.iconButtonPress});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: iconButtonPress,
      icon: Icon(
        iconButtonIcon,
        color: Colors.grey,
      ),
      color: kActiveCardColor,
    );
  }
}
