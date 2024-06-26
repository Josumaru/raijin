import 'package:flutter/material.dart';
import 'package:raijin/core/constants/colors.dart';
// import 'package:raijin/core/themes/bottom_sheet_theme/bottom_sheet_theme.dart';
import 'package:raijin/core/themes/checkbox_theme/checkbox_theme.dart';
// import 'package:raijin/core/themes/chip_theme/chip_theme.dart';
import 'package:raijin/core/themes/elevated_button_theme/elevated_button_theme.dart';
import 'package:raijin/core/themes/input_decoration_theme/input_decoration_theme.dart';
import 'package:raijin/core/themes/outlined_button_theme/outlined_button_theme.dart';
import 'package:raijin/core/themes/text_button_theme/text_button_theme.dart';
import 'package:raijin/core/themes/text_theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    dividerColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor).copyWith(
      background: kMainLightBackgroundColor,
      onBackground: kMainLightOnBackgroundColor,
      error: kMainLightError,
      onError: kMainLightOnError,
      surface: kMainLightSurfaceColor,
      onSurface: kMainLightOnSurfaceColor,
      primary: kPrimaryColor,
      onPrimary: kMainLightTextColor,
    ),
    canvasColor: kMainLightBackgroundColor,
    fontFamily: "Outfit",
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kMainLightBackgroundColor,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    // bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    // chipTheme: TChipTheme.lightChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedTheme,
    inputDecorationTheme: TInputDecorationTheme.lightInputDecorationTheme,
    textButtonTheme: TTextButtonTheme.lightTextButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    dividerColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor).copyWith(
      background: kMainDarkBackgroundColor,
      onBackground: kMainDarkOnBackgroundColor,
      error: kMainDarkError,
      onError: kMainDarkOnError,
      surface: kMainDarkSurfaceColor,
      onSurface: kMainDarkOnSurfaceColor,
      primary: kPrimaryColor,
      onPrimary: kMainDarkTextColor,
    ),
    canvasColor: kMainDarkBackgroundColor,
    useMaterial3: true,
    fontFamily: "Outfit",
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kMainDarkBackgroundColor,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    // bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    // chipTheme: TChipTheme.darkChipTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedTheme,
    inputDecorationTheme: TInputDecorationTheme.darkInputDecorationTheme,
    textButtonTheme: TTextButtonTheme.darkTextButtonTheme,
  );
}
