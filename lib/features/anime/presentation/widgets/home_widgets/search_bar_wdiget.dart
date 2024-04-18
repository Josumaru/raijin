import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/padding.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kMainPadding,
      child: Column(
        children: [
          TextFormField(
            autocorrect: true,
            decoration: InputDecoration(
              // prefixIcon: const Icon(Iconsax.search_normal_14),
              // enabledBorder: InputBorder.none,
              // focusedBorder: InputBorder.none,
              // label: Text(
              //   'Search',
              //   style: bodySmall(context: context),
              // ),
              suffixIcon: LoadingAnimationWidget.threeArchedCircle(
                color: primaryColor(context: context),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
