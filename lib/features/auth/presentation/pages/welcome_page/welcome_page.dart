import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        children: [
          _buildPageView(),
          _buildStarter(context),
        ],
      ),
    );
  }

  PageView _buildPageView() {
    return PageView(
      controller: _pageController,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                'Welcome to',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 64,
                ),
              ),
              Text(
                'Raijin',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kMainAccentColor,
                  fontSize: 64,
                ),
              ),
              Text(
                'Discover more than 100+ anime with one single apps update every single week',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                'Watch and enjoy your favourite anime with many features',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    // color: Color.fromARGB(204, 255, 255, 255),
                    fontSize: 16),
              ),
              SizedBox(height: 128),
            ],
          ),
        ),
        const Center(
          child: Text('2'),
        ),
        const Center(
          child: Text('3'),
        ),
      ],
    );
  }

  _buildStarter(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: WormEffect(
            dotHeight: 4,
            dotWidth: 16,
            spacing: 2,
            activeDotColor: kMainAccentColor,
            dotColor: kMainAccentColor.withOpacity(0.2),
            type: WormType.thinUnderground,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Material(
            color: kMainAccentColor,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.popAndPushNamed(context, '/main');
              },
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get started',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Iconsax.arrow_right_41,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
