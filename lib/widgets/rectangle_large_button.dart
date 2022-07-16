import 'package:flutter/material.dart';

import '../constants.dart';

class RectangleLargeButton extends StatelessWidget {
  final String title;
  final void Function() onTap;

  RectangleLargeButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        color: kBottomContainerColor,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
