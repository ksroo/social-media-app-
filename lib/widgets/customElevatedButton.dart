import 'package:flutter/material.dart';
import '../utils/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double horizontal;
  final double vertical;
  final double fontSize;

  CustomElevatedButton(
      {@required this.text,
      @required this.onPressed,
      @required this.horizontal,
      @required this.vertical,
      @required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
        ),
        style: ElevatedButton.styleFrom(
          primary: kBlue,
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          shadowColor: kBlue,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: TextStyle(
            fontSize: fontSize,
            color: kwhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
