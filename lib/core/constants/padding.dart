import 'package:flutter/widgets.dart';

double kPadding = 10;
double kSecondaryPadding = 5;

EdgeInsetsGeometry toastPadding = const EdgeInsets.symmetric(
  vertical: 5,
  horizontal: 10,
);

EdgeInsetsGeometry kMainPadding = EdgeInsets.only(
  top: kPadding,
  bottom: 0,
  left: kSecondaryPadding,
  right: kSecondaryPadding,
);

EdgeInsetsGeometry kLeftPadding = EdgeInsets.only(
  bottom: 0,
  left: kPadding,
  right: 0,
  top: 0,
);

EdgeInsetsGeometry kRightPadding = EdgeInsets.only(
  bottom: 0,
  left: 0,
  right: kPadding,
  top: 0,
);

EdgeInsetsGeometry kTopPadding = EdgeInsets.only(
  bottom: 0,
  left: 0,
  right: 0,
  top: kPadding,
);

EdgeInsetsGeometry kBottomPadding = EdgeInsets.only(
  bottom: kPadding,
  left: 0,
  right: 0,
  top: 0,
);

EdgeInsetsGeometry kHorizontalPadding =
    EdgeInsets.symmetric(horizontal: kPadding, vertical: 0);

EdgeInsetsGeometry kVerticalPadding =
    EdgeInsets.symmetric(horizontal: 0, vertical: kPadding);

EdgeInsetsGeometry kAllPadding = EdgeInsets.all(kPadding);
