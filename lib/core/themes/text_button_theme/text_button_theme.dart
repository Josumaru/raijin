import 'package:flutter/material.dart';
import 'package:raijin/core/constants/colors.dart';

class TTextButtonTheme {
  // Light
  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: const ButtonStyle().copyWith(
      foregroundColor: MaterialStatePropertyAll(kPrimaryColor.withOpacity(0.75)),
      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0, horizontal: 4))
    ),
  );

  // Dark
  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: const ButtonStyle().copyWith(
      foregroundColor: MaterialStatePropertyAll<Color>(kPrimaryColor.withOpacity(0.75)),
      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0, horizontal: 4))

    ),
  );
}