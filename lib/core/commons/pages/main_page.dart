import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/features/anime/presentation/pages/schedule_page.dart';
import 'package:raijin/features/anime/presentation/pages/discover_page.dart';
import 'package:raijin/features/anime/presentation/pages/home_page.dart';
import 'package:raijin/features/anime/presentation/pages/user_page.dart';

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
      _buildNavBarItem(context: context, title: 'Home', icon: Iconsax.home),
      _buildNavBarItem(
          context: context, title: 'Schedule', icon: Iconsax.calendar),
      _buildNavBarItem(
          context: context, title: 'Discover', icon: Iconsax.discover),
      _buildNavBarItem(
          context: context, title: 'Me', icon: Iconsax.user_octagon,),
    ];
  }

  PersistentBottomNavBarItem _buildNavBarItem(
      {required BuildContext context,
      required String title,
      required IconData icon}) {
    return PersistentBottomNavBarItem(
      activeColorPrimary: primaryColor(context: context),
      inactiveColorPrimary: onBackgroundColor(context: context).withOpacity(
        0.3,
      ),
      icon: SizedBox(child: Icon(icon)),
      title: title,
    );
  }

  List<Widget> get _buildScreens {
    return const [
      HomePage(),
      SchedulePage(),
      DiscoverPage(),
      UserPage(),
    ];
  }
}
      