import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/services/injection_container.dart';

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
          Expanded(
            child: Padding(
              padding: kLeftPadding,
              child: Column(
                mainAxisAlignment: kMainAxisAligmentCenter(),
                crossAxisAlignment: kCrossAxisAlignmentStart(),
                children: [
                  Text(
                    'Welcome Back!',
                    style: bodySmall(context: context),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    sl<FirebaseAuth>().currentUser!.displayName!,
                    style: bodyLarge(context: context).copyWith(fontSize: 24),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
