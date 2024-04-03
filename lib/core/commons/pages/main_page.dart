import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/presentation/pages/detail_page.dart';
import 'package:raijin/features/anime/presentation/pages/home_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final PersistentTabController _persistentTabController =
      PersistentTabController();
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      confineInSafeArea: true,
      backgroundColor: backgroundColor(context: context),
      stateManagement: true,
      resizeToAvoidBottomInset: true,
      navBarStyle: NavBarStyle.style3,
      controller: _persistentTabController,
      screens: _buildScreens,
      items: _buildItems(context),
    );
  }

  List<PersistentBottomNavBarItem> _buildItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Iconsax.home,
          color: onBackgroundColor(context: context),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          width: widthMediaQuery(context: context) / 2,
          child: Icon(
            Iconsax.discover,
            color: onBackgroundColor(context: context),
          ),
        ),
      ),
    ];
  }

  List<Widget> get _buildScreens {
    return const [
      HomePage(),
      DetailPage(),
    ];
  }
}
