import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants instance = ColorConstants._init();
  ColorConstants._init();
  final white = Color(0xffffffff);
  final black = Color(0xff000000);

  final primaryColor = Color(0xffffffff);
  final accentColor = Colors.blueGrey;
  final focusColor = Color.fromRGBO(6, 5, 61, 1.0);

  final textTitle = Color.fromRGBO(217, 231, 250, 1.0);
  final textSubtitle = Color.fromRGBO(255, 248, 202, 1.0);
  final button = Color.fromRGBO(253, 36, 36, 1.0);
  final backgroudColor = Color.fromRGBO(0, 31, 45, 1.0);

  final graStart = Color.fromRGBO(0, 42, 61, 1.0);
  final graEnd = Color.fromRGBO(1, 65, 92, 1.0);
}
