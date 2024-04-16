import 'package:flutter/material.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class AnimeEpisodeCardShimmer extends StatelessWidget {
  const AnimeEpisodeCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: onBackgroundColor(context: context).withOpacity(0.1),
      highlightColor: onBackgroundColor(context: context).withOpacity(0.3),
      child: Container(
        decoration: BoxDecoration(
          color: kMainAccentColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      backgroundColor(context: context).withOpacity(0.4),
                      backgroundColor(context: context).withOpacity(0.4),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
