import 'package:flutter/material.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/padding.dart';

class ToastWidget extends StatelessWidget {
  const ToastWidget({super.key, required this.message});
  final String message;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: toastPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: kMainAccentColor.withOpacity(0.9),
      ),
      child: Text(message),
    );
  }
}
