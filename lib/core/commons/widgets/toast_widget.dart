import 'package:flutter/material.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/margin.dart';
import 'package:raijin/core/constants/padding.dart';

class ToastWidget extends StatelessWidget {
  const ToastWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: toastMainMargin,
      padding: kAllPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: onBackgroundColor(context: context).withOpacity(0.9),
      ),
      child: Text(
        message,
        style: bodyMedium(context: context).copyWith(
          color: backgroundColor(context: context),
        ),
      ),
    );
  }
}
