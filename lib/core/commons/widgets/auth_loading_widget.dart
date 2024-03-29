import 'package:flutter/cupertino.dart';
import 'package:raijin/core/constants/constants.dart';

class AuthLoadingWidget extends StatelessWidget {
  const AuthLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: kMainAccentColor.withOpacity(0.2),
          ),
          child: const CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
