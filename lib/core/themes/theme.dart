import 'package:flutter/material.dart';
import 'package:raijin/core/constants/constants.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Outfit",
    brightness: Brightness.light,
    primaryColor: kMainAccentColor,
    scaffoldBackgroundColor: kMainLightBackgroundColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: kMainLightTextColor,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: kMainLightTextColor,
      ),
      bodyMedium: TextStyle(
        color: kMainLightTextColor,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        color: kMainLightTextColor,
        fontWeight: FontWeight.w100,
      ),
      headlineSmall: TextStyle(
        color: kMainDarkTextColor,
        fontWeight: FontWeight.w100,
        fontSize: 10,
      ),
      headlineMedium: TextStyle(
        color: kMainAccentColor,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    ),
    iconTheme: const IconThemeData(
      color: kMainLightTextColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "OpenSans",
    brightness: Brightness.light,
    primaryColor: kMainAccentColor,
    scaffoldBackgroundColor: kMainDarkBackgroundColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: kMainDarkTextColor,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: kMainDarkTextColor,
      ),
      bodyMedium: TextStyle(
        color: kMainDarkTextColor,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        color: kMainDarkTextColor,
        fontWeight: FontWeight.w100,
      ),
      headlineSmall: TextStyle(
        color: kMainLightTextColor,
        fontWeight: FontWeight.w100,
        fontSize: 10,
      ),
      headlineMedium: TextStyle(
        color: kMainAccentColor,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    ),
    iconTheme: const IconThemeData(
      color: kMainDarkTextColor,
    ),
  );
}
