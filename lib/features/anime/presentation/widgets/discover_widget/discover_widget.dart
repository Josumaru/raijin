import 'package:flutter/material.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/search_bar_wdiget.dart';

class DiscoverWidget extends StatelessWidget {
  const DiscoverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SearchBarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
