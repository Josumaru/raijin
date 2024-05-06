import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/features/anime/presentation/pages/schedule_page.dart';
import 'package:raijin/features/anime/presentation/pages/discover_page.dart';
import 'package:raijin/features/anime/presentation/pages/home_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final PersistentTabController _controller = PersistentTabController();
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return PersistentTabView(
      context,
      confineInSafeArea: true,
      backgroundColor: backgroundColor(context: context),
      stateManagement: true,
      resizeToAvoidBottomInset: true,
      neumorphicProperties: const NeumorphicProperties(
        showSubtitleText: true,
      ),
      navBarStyle: NavBarStyle.style3,
      controller: _controller,
      hideNavigationBar: isLandscape ? true : false,
      hideNavigationBarWhenKeyboardShows: true,
      screens: _buildScreens,
      items: _buildItems(context),
    );
  }

  List<PersistentBottomNavBarItem> _buildItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: primaryColor(context: context),
        inactiveColorPrimary: onBackgroundColor(context: context).withOpacity(
          0.3,
        ),
        icon: const Icon(Iconsax.home),
        title: 'Home',
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: primaryColor(context: context),
        inactiveColorPrimary: onBackgroundColor(context: context).withOpacity(
          0.3,
        ),
        icon: const Icon(Iconsax.calendar),
        title: 'Schedule',
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: primaryColor(context: context),
        inactiveColorPrimary: onBackgroundColor(context: context).withOpacity(
          0.3,
        ),
        icon: const SizedBox(child: Icon(Iconsax.discover)),
        title: 'Discover',
      ),
    ];
  }

  List<Widget> get _buildScreens {
    return const [
      HomePage(),
      SchedulePage(),
      DiscoverPage(),
    ];
  }
}
