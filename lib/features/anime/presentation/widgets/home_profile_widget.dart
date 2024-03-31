import 'package:flutter/material.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';

class HomeProfileWidget extends StatelessWidget {
  const HomeProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kMainPadding,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          Padding(
            padding: kLeftPadding,
            child: Column(
              mainAxisAlignment: kMainAxisAligmentCenter(),
              crossAxisAlignment: kCrossAxisAlignmentStart(),
              children: [
                Text(
                  'Continue watching Kaguya Sama!',
                  style: bodySmall(context: context),
                ),
                Text(
                  'Josu',
                  style: bodyLarge(context: context).copyWith(fontSize: 24),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
