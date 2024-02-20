import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/auth');
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.logout_1),
              Text('Logout'),
            ],
          ),
        ),
      ),
    );
  }
}
