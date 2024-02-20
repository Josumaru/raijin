import 'package:flutter/material.dart';
import 'package:raijin/core/constants/constants.dart';

class TCheckboxTheme {
  // Light
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? kMainLightBackgroundColor : kMainDarkBackgroundColor),
    fillColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? kPrimaryColor : kMainLightBackgroundColor.withOpacity(0)),
  );

  // Dark
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? kMainLightBackgroundColor : kMainDarkBackgroundColor),
    fillColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? kPrimaryColor : kMainLightBackgroundColor.withOpacity(0)),
  );
}