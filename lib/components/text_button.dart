import 'package:flutter/material.dart';

Widget textButton({
  @required String text,
  @required double fontSize,
  @required Color color,
  @required Function onPressed,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
