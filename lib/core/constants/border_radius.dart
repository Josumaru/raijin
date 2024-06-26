import 'package:flutter/material.dart';

BorderRadius kMainBorderRadius = BorderRadius.circular(10);
BorderRadius kMainCircleBorderRadius = BorderRadius.circular(100);
BorderRadius kLargeBorderRadius = BorderRadius.circular(20);
BorderRadius kTopLeftBorderRadius = const BorderRadius.only(
  topLeft: Radius.circular(10),
);
BorderRadius kTopLeftBottomRightBorderRadius = const BorderRadius.only(
  topLeft: Radius.circular(10),
  bottomRight: Radius.circular(10),
);

BorderRadius kTopBorderRadius = const BorderRadius.only(
  topLeft: Radius.circular(10),
  topRight: Radius.circular(10),
);
