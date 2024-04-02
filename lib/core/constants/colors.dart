import 'package:flutter/material.dart';

// Dark
const Color kMainDarkBackgroundColor = Color.fromARGB(255, 19, 27, 29);
const Color kMainDarkOnBackgroundColor = Color.fromARGB(255, 255, 255, 255);
const Color kMainDarkTextColor = Color.fromARGB(255, 255, 255, 255);
const Color kMainDarkSurfaceColor = kMainAccentColor;
const Color kMainDarkOnSurfaceColor = kMainAccentColor;
const Color kMainDarkOnDarkSurfaceColor = kMainAccentColor;
const Color kMainDarkError = kMainDangerColor;
const Color kMainDarkOnError = kMainDarkTextColor;

// Light
const Color kMainLightBackgroundColor = Color.fromARGB(255, 255, 255, 255);
const Color kMainLightOnBackgroundColor = Color.fromARGB(255, 0, 0, 0);
const Color kMainLightTextColor = Color.fromARGB(255, 0, 0, 0);
const Color kMainLightSurfaceColor = kMainAccentColor;
const Color kMainLightOnSurfaceColor = kMainAccentColor;
const Color kMainLightOnDarkSurfaceColor = kMainAccentColor;
const Color kMainLightError = kMainDangerColor;
const Color kMainLightOnError = kMainDarkTextColor;

// Global
const Color kMainAccentColor = Color.fromARGB(255, 11, 110, 224);
const Color kPrimaryColor = Color.fromARGB(255, 11, 110, 224);

const Color kMainBorderColor = Color.fromARGB(255, 160, 160, 160);
const Color kMainDangerColor = Color.fromARGB(255, 235, 71, 59);
const Color kMainWarningColor = Colors.amber;

Color backgroundColor({required BuildContext context}) =>
    Theme.of(context).colorScheme.background;
Color onBackgroundColor({required BuildContext context}) =>
    Theme.of(context).colorScheme.onBackground;
Color errorColo({required BuildContext context}) =>
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
