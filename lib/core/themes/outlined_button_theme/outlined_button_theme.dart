import 'package:flutter/material.dart';
import 'package:raijin/core/constants/colors.dart';

class TOutlinedButtonTheme {

  // Light
  static OutlinedButtonThemeData lightOutlinedTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: kMainDarkBackgroundColor,
      side: const BorderSide(color: kPrimaryColor),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      textStyle: const TextStyle(color: kMainDarkBackgroundColor, fontSize: 16, fontWeight: FontWeight.w500)
    ),
  );

  // Dark
  static OutlinedButtonThemeData darkOutlinedTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: kMainLightBackgroundColor,
      side: const BorderSide(color: kPrimaryColor),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      textStyle: const TextStyle(color: kMainDarkBackgroundColor, fontSize: 16, fontWeight: FontWeight.w500)
    ),
  );
}
