import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:raijin/core/constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, double? size}) : _size = size;
  final double? _size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.stretchedDots(
        color: onBackgroundColor(context: context),
        size: _size ?? 40,
      ),
    );
  }
}
