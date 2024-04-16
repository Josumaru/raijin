import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:raijin/core/constants/colors.dart';

class LoadinWidget extends StatelessWidget {
  const LoadinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.stretchedDots(
        color: backgroundColor(context: context),
        size: 40,
      ),
    );
  }
}
