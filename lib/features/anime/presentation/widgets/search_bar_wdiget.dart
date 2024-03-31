import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kLeftPadding,
      child: Column(
        children: [
          TextFormField(
            autocorrect: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.search_normal),
              suffixIcon: Padding(
                padding: kRightPadding,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: kTabLabelPadding,
                    decoration: BoxDecoration(
                        color: primaryContainerColor(context: context),
                        borderRadius: kMainBorderRadius),
                    child: const Icon(Iconsax.filter),
                  ),
                ),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              label:
                  Text('Search for anime', style: bodySmall(context: context)),
            ),
          ),
        ],
      ),
    );
  }
}
