import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/anime/presentation/bloc/page/page_bloc.dart';
import 'package:raijin/features/anime/presentation/pages/bookmark/bookmark_page.dart';
import 'package:raijin/features/anime/presentation/pages/download/download_page.dart';
import 'package:raijin/features/anime/presentation/pages/home/home_page.dart';
import 'package:raijin/features/anime/presentation/pages/setting/setting_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  final List<Widget> pages = [
    const HomePage(),
    const BookmarkPage(),
    const DownloadPage(),
    const SettingPage(),
  ];

  _buildBody() {
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) => pages[state.page!],
    );
  }

  _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        0,
        20,
        20,
      ),
      child: BlocBuilder<PageBloc, PageState>(
        builder: (context, state) {
          return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
              child: BottomNavigationBar(
                backgroundColor: Color.fromARGB(0, 189, 35, 35),
                fixedColor: Colors.white,
                unselectedItemColor: Colors.white.withOpacity(0.3),
                currentIndex: state.page!,
                unselectedFontSize: 0,
                elevation: 0,
                selectedFontSize: 15,
                useLegacyColorScheme: true,
                enableFeedback: false,
                onTap: (value) {
                  context.read<PageBloc>().add(SetPageEvent(page: value));
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.home),
                    activeIcon: Icon(Iconsax.home_15),
                    label: 'Home',
                    backgroundColor: kMainAccentColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.bookmark4),
                    activeIcon: Icon(Iconsax.bookmark_24),
                    label: 'Bookmark',
                    backgroundColor: kMainAccentColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.document_download),
                    activeIcon: Icon(Iconsax.document_download5),
                    label: 'Download',
                    backgroundColor: kMainAccentColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.user_octagon),
                    activeIcon: Icon(Iconsax.user_octagon),
                    label: 'Me',
                    backgroundColor: kMainAccentColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
