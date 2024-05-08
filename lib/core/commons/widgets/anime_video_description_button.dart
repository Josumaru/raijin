import 'package:flutter/material.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';

class AnimeVideoDescriptionButton extends StatelessWidget {
  const AnimeVideoDescriptionButton({
    super.key,
    required IconData icon,
    required String text,
    required VoidCallback callback,
  })  : _text = text,
        _icon = icon,
        _callback = callback;
  final String _text;
  final IconData _icon;
  final VoidCallback _callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthMediaQuery(context: context) / 3,
      child: Padding(
        padding: kVerticalPadding,
        child: InkWell(
          onTap: _callback,
          borderRadius: kMainBorderRadius,
          child: Column(
            children: [
              Icon(
                _icon,
                color: onBackgroundColor(context: context),
              ),
              Text(_text),
            ],
          ),
        ),
      ),
    );
  }
}
