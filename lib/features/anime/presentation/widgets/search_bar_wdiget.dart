import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/font.dart';
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
              prefixIcon: const Icon(Iconsax.search_normal),
              // enabledBorder: InputBorder.none,
              // focusedBorder: InputBorder.none,
              label: Text(
                'Search for anime',
                style: bodySmall(context: context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
