import 'package:flutter/material.dart';
import 'package:raijin/core/constants/constants.dart';

class TBottomSheetTheme {
  // Light
  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: kMainLightBackgroundColor,
    modalBackgroundColor: kMainLightBackgroundColor,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  // Dark
  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: kMainLightBackgroundColor,
    modalBackgroundColor: kMainLightBackgroundColor,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
