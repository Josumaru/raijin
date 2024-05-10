import 'package:flutter/material.dart';

// Dark
const Color kMainDarkBackgroundColor = Color.fromARGB(255, 19, 24, 26);
const Color kMainDarkOnBackgroundColor = Color.fromARGB(255, 255, 255, 255);
const Color kMainDarkTextColor = Color.fromARGB(255, 255, 255, 255);
const Color kMainDarkSurfaceColor = kPrimaryColor;
const Color kMainDarkOnSurfaceColor = kPrimaryColor;
const Color kMainDarkOnDarkSurfaceColor = kPrimaryColor;
const Color kMainDarkError = kMainDangerColor;
const Color kMainDarkOnError = kMainDarkTextColor;

// Light
const Color kMainLightBackgroundColor = Color.fromARGB(255, 255, 255, 255);
const Color kMainLightOnBackgroundColor = Color.fromARGB(255, 0, 0, 0);
const Color kMainLightTextColor = Color.fromARGB(255, 0, 0, 0);
const Color kMainLightSurfaceColor = kPrimaryColor;
const Color kMainLightOnSurfaceColor = kPrimaryColor;
const Color kMainLightOnDarkSurfaceColor = kPrimaryColor;
const Color kMainLightError = kMainDangerColor;
const Color kMainLightOnError = kMainDarkTextColor;

// Global
// const Color kMainAccentColor = Color.fromARGB(255, 231, 119, 119);
const Color kPrimaryColor = Color(0xffef4444);
// const Color kMainAccentColor = Color(0xff275ad2);
// const Color kPrimaryColor = Color(0xff275ad2);

const Color kMainBorderColor = Color.fromARGB(255, 160, 160, 160);
const Color kMainDangerColor = Color.fromARGB(255, 235, 71, 59);
const Color kMainWarningColor = Colors.amber;

Color backgroundColor({required BuildContext context}) =>
    Theme.of(context).colorScheme.background;
Color onBackgroundColor({required BuildContext context}) =>
    Theme.of(context).colorScheme.onBackground;
Color errorColor({required BuildContext context}) =>
    Theme.of(context).colorScheme.error;
Color onErrorColor({required BuildContext context}) =>
    Theme.of(context).colorScheme.onError;
Color primaryContainerColor({required BuildContext context}) =>
    Theme.of(context).colorScheme.primaryContainer;
Color onPrimaryContainerColor({required BuildContext context}) =>
    Theme.of(context).colorScheme.onPrimaryContainer;
Color primaryColor({required BuildContext context}) =>
    Theme.of(context).colorScheme.primary;
Color onPrimaryColor({required BuildContext context}) =>
    Theme.of(context).colorScheme.onPrimary;
Color secondaryColor({required BuildContext context}) =>
    Theme.of(context).colorScheme.secondary;
Color onSecondaryColor({required BuildContext context}) =>
    Theme.of(context).colorScheme.onSecondary;
Color surface({required BuildContext context}) =>
    Theme.of(context).colorScheme.surface;
Color onSurface({required BuildContext context}) =>
    Theme.of(context).colorScheme.onSurface;

List<Color> gradientListColor({required BuildContext context}) => [
      Colors.transparent,
      kMainDarkBackgroundColor,
    ];

Gradient gradientColor({required BuildContext context}) => const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(85, 0, 0, 0),
        kMainDarkBackgroundColor,
      ],
    );

Color darkColor() => kMainDarkBackgroundColor.withOpacity(0.3);

List<Color> gradientVideoListColor({required BuildContext context}) => [
      Colors.transparent,
      kMainDarkBackgroundColor.withOpacity(0.9),
    ];
