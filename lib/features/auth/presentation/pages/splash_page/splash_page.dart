import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final bool isLogin = false;
  @override
  void initState() {
    super.initState();
    _setPage(
      context: context,
      isLogin: isLogin,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context: context),
    );
  }

  _setPage({required BuildContext context, required bool isLogin}) async {
    Timer(
      const Duration(seconds: 1),
      isLogin
          ? () => Navigator.popAndPushNamed(context, '/main')
          : () => Navigator.popAndPushNamed(context, '/welcome')
    );
  }

  _buildBody({required BuildContext context}) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
        ),
        Icon(Iconsax.flash_14, size: 80, weight: 0.002,color: Theme.of(context).primaryColor,),
        const Text(
          'Raijin',
          style: TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
        const Spacer(),
        const Column(
          children: [
            Text(
              'from',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Josu',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'maru',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: kMainAccentColor
                  ),
                ),
              ],
            ),
            SizedBox(height: 32)
          ],
        ),
      ],
    );
  }
}
