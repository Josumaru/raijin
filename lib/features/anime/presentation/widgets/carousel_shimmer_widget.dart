import 'package:flutter/material.dart';
import 'package:raijin/core/constants/colors.dart';

class CarouselShimmerWidget extends StatelessWidget {
  const CarouselShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: primaryColor(context: context)),
    );
  }
}
