import 'package:flutter/material.dart';

import 'colors.dart';

var appTheme = ThemeData(
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryLightColor,
    primaryColorDark: kPrimaryDarkColor,
    accentColor: kAccentColor,
    textTheme: appTextTheme);

var appTextTheme = TextTheme(
  headline1: TextStyle(
      fontFamily: "Gotham",
      fontSize: 96,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5),
  headline2: TextStyle(
      fontFamily: "Gotham",
      fontSize: 60,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5),
  headline3: TextStyle(
      fontFamily: "Gotham", fontSize: 48, fontWeight: FontWeight.w400),
  headline4: TextStyle(
      fontFamily: "Gotham",
      fontSize: 34,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25),
  headline5: TextStyle(
      fontFamily: "Gotham", fontSize: 24, fontWeight: FontWeight.w400),
  headline6: TextStyle(
      fontFamily: "Gotham",
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15),
  subtitle1: TextStyle(
      fontFamily: "Gotham",
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15),
  subtitle2: TextStyle(
      fontFamily: "Gotham",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1),
  bodyText1: TextStyle(
      fontFamily: "Gotham",
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5),
  bodyText2: TextStyle(
      fontFamily: "Gotham",
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25),
  button: TextStyle(
      fontFamily: "Gotham",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25),
  caption: TextStyle(
      fontFamily: "Gotham",
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4),
  overline: TextStyle(
      fontFamily: "Gotham",
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5),
);
