import 'package:flutter/material.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';

class AnimeVideoIconButton extends StatelessWidget {
  const AnimeVideoIconButton({
    super.key,
    String? text,
    required IconData icon,
    required VoidCallback callback,
  })  : _text = text ?? '',
        _icon = icon,
        _callback = callback;

  final String _text;
  final IconData _icon;
  final VoidCallback _callback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: kMainBorderRadius,
      onTap: _callback,
      child: Padding(
        padding: kRightPadding,
        child: Row(
          children: [
            Icon(
              _icon,
              color: Colors.white.withOpacity(0.7),
            ),
            Padding(
              padding: kLeftPadding * 0.2,
              child: Text(
                _text,
                style: bodyMedium(
                  context: context,
                ).copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
