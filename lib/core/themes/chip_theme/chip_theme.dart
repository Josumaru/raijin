import 'package:flutter/material.dart';
import 'package:raijin/core/constants/constants.dart';

class TChipTheme {

  // Light
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.5),
    labelStyle: const TextStyle(color: kMainLightTextColor),
    selectedColor: kPrimaryColor,
    padding: const EdgeInsets.all(12),
    checkmarkColor: kMainLightBackgroundColor,
  );

  // Dark
  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: TextStyle(color: kMainLightTextColor),
    selectedColor: kPrimaryColor,
    padding: EdgeInsets.all(12),
    checkmarkColor: kMainLightBackgroundColor,
  );
}