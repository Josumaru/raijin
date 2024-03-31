import 'package:flutter/material.dart';
import 'package:raijin/core/constants/colors.dart';


class TElevatedButtonTheme {
  // Dark
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: kMainLightBackgroundColor,
      backgroundColor: kPrimaryColor,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      side: const BorderSide(color: kPrimaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: kMainLightTextColor, fontWeight: FontWeight.w600, fontFamily: 'Outfit'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );

  // Light
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: kMainLightBackgroundColor,
      backgroundColor: kPrimaryColor,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      side: const BorderSide(color: kPrimaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: kMainLightTextColor, fontWeight: FontWeight.w600, fontFamily: 'Outfit'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );


}