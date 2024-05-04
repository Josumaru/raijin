import 'package:flutter/widgets.dart';

double heightMediaQuery({required BuildContext context}) => MediaQuery.of(context).size.height;
double widthMediaQuery({required BuildContext context}) => MediaQuery.of(context).size.width;
EdgeInsets paddingMediaQuery({required BuildContext context}) => MediaQuery.of(context).padding;

