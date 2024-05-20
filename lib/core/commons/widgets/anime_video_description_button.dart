import 'package:flutter/material.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';

class AnimeVideoDescriptionButton extends StatelessWidget {
  const AnimeVideoDescriptionButton({
    super.key,
    required IconData icon,
    required String text,
    required VoidCallback callback,
    required Widget widget,
  })  : _text = text,
        _icon = icon,
        _callback = callback,
        _widget = widget;

  final String _text;
  final IconData _icon;
  final VoidCallback _callback;
  final Widget _widget;

  @override
  Widget build(BuildContext context) {
    final double width = widthMediaQuery(context: context) / 3 - kPadding;
    return SizedBox(
      width: width,
      height: width,
      child: Padding(
        padding: kVerticalPadding,
        child: InkWell(
          onTap: _callback,
          borderRadius: kMainBorderRadius,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: kMainAxisAligmentCenter(),
                  crossAxisAlignment: kCrossAxisAlignmentCenter(),
                  children: [
                    Icon(
                      _icon,
                      color: onBackgroundColor(context: context),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _text,
                      style: bodySmall(context: context),
                    ),
                  ],
                ),
              ),
              _widget,
            ],
          ),
        ),
      ),
    );
  }
}
