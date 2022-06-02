import 'package:flutter/material.dart';
import 'package:marvel_app/view/theme/sizes.dart';

import 'colors.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
        fontFamily: 'Poopins',
        backgroundColor: ColorConstants.instance.backgroudColor,
        primaryColor: ColorConstants.instance.primaryColor,
        accentColor: ColorConstants.instance.accentColor,
        focusColor: ColorConstants.instance.focusColor,
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
        ),
        iconTheme: IconThemeData(
          opacity: 1,
          size: Sizes.iconSize,
          color: ColorConstants.instance.button,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(),
        ),
        textTheme: TextTheme(
          //Hint Text style
          headline1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: ColorConstants.instance.white,
          ),
          //ButtonTextStyle
          headline2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: ColorConstants.instance.white,
          ),
          subtitle1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: ColorConstants.instance.textSubtitle,
          ),
          subtitle2: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: ColorConstants.instance.white,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: ColorConstants.instance.textSubtitle,
          ),
        ),
      );
}
