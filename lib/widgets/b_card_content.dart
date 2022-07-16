import 'package:flutter/material.dart';

import '../constants.dart';
import 'bcard_icon_button.dart';

class BCardContent extends StatelessWidget {
  final String cardLabel;
  final int val;
  final void Function() onpressedAdd;
  final void Function() onpressedSub;

  BCardContent(
      {required this.cardLabel,
      required this.val,
      required this.onpressedAdd,
      required this.onpressedSub});

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          cardLabel,
          style: kLabelTextStyle,
        ),
        Text(
          val.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: kInActiveCardColor,
              ),
              child: BCardIconButton(
                iconButtonIcon: Icons.remove,
                iconButtonPress: onpressedSub,
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: kInActiveCardColor,
              ),
              child: BCardIconButton(
                iconButtonIcon: Icons.add,
                iconButtonPress: onpressedAdd,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
