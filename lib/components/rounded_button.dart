import 'package:digital_plan_test/palette.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.buttonColor,
        required this.buttonTitle,
        required this.onPressed});
  final Color buttonColor;
  final String buttonTitle;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(16.0),
        elevation: 5.0,
        child: MaterialButton(
          // elevation: 2,
          onPressed: onPressed,
          minWidth: 200.0,
          height: size.height * 0.08,
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: kSub1,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
