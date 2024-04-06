import 'package:flutter/material.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:shimmer/shimmer.dart';

class AnimeCardShimmerWidget extends StatelessWidget {
  const AnimeCardShimmerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: onBackgroundColor(context: context).withOpacity(0.1),
      highlightColor: onBackgroundColor(context: context).withOpacity(0.3),
      child: Column(
        mainAxisAlignment: kMainAxisAligmentStart(),
        crossAxisAlignment: kCrossAxisAlignmentStart(),
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: kLeftPadding,
            child: Container(
              width: 140,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: kMainBorderRadius / 2,
                color: backgroundColor(context: context),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: index == 0 ? kHorizontalPadding : kRightPadding,
                  child: Column(
                    children: [
                      Container(
                        width:
                            (widthMediaQuery(context: context) / 3) - (40 / 3),
                        height: heightMediaQuery(context: context) / 4.5,
                        decoration: BoxDecoration(
                          borderRadius: kMainBorderRadius,
                          color: backgroundColor(context: context),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        width:
                            (widthMediaQuery(context: context) / 3) - (40 / 3),
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: kMainBorderRadius / 2,
                          color: backgroundColor(context: context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
