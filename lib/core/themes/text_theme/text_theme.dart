import 'package:flutter/material.dart';
import 'package:raijin/core/constants/constants.dart';

class TTextTheme {
  // TTextTheme
  static TextTheme lightTextTheme = TextTheme(
    // Headline
    headlineLarge: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.bold, color: kPrimaryColor),
    headlineMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.bold, color: kPrimaryColor),
    headlineSmall: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.bold, color: kPrimaryColor),
    
    //Body
    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w600, color: kMainLightTextColor),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: kMainLightTextColor),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w400, color: kMainLightTextColor.withOpacity(0.5)),

    // Title
    titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: kMainLightTextColor),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: kMainLightTextColor),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: kMainLightTextColor),

    // Label
    labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w600, color: kMainDarkTextColor),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: kMainDarkTextColor),
    labelSmall: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: kMainDarkTextColor.withOpacity(0.5)),
  );

  static TextTheme darkTextTheme = TextTheme(

    // Headline
    headlineLarge: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.bold, color: kPrimaryColor),
    headlineMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w600, color: kPrimaryColor),
    headlineSmall: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w300, color: kPrimaryColor),
    
    //Body
    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w600, color: kMainDarkTextColor),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: kMainDarkTextColor),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w400, color: kMainDarkTextColor.withOpacity(0.5)),

    // Title
    titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: kMainDarkTextColor),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: kMainDarkTextColor),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: kMainDarkTextColor),

    // Label
    labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.w600, color: kMainDarkTextColor),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: kMainDarkTextColor),
    labelSmall: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: kMainDarkTextColor.withOpacity(0.5)),
  );
}