import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';

class SettingItemWidget extends StatelessWidget {
  const SettingItemWidget({
    required String select,
    required String option,
    required IconData icon,
    required VoidCallback callback,
    super.key,
  })  : _select = select,
        _option = option,
        _icon = icon,
        _callback = callback;

  final String _select;
  final String _option;
  final IconData _icon;
  final VoidCallback _callback;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _callback,
      child: Padding(
        padding: kAllPadding,
        child: Row(
          crossAxisAlignment: kCrossAxisAlignmentCenter(),
          children: [
            Icon(
              _icon,
              color: onBackgroundColor(context: context).withOpacity(0.5),
            ),
            const SizedBox(width: 8),
            Text(
              _select,
              style: bodyMedium(context: context).copyWith(
                color: onBackgroundColor(context: context),
              ),
            ),
            const Spacer(),
            InkWell(
              borderRadius: kMainBorderRadius,
              onTap: () {
                // _buildMore(context);
              },
              child: Padding(
                padding: kLeftPadding,
                child: Row(
                  children: [
                    Text(
                      _option,
                      style: bodySmall(context: context),
                    ),
                    Icon(
                      Iconsax.arrow_right_3,
                      color:
                          onBackgroundColor(context: context).withOpacity(0.5),
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
