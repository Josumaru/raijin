import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key, required this.images});

  final List<String> images;
  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> images = widget.images;
    return Column(
      children: [
        const SizedBox(height: 4),
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: kHorizontalPadding,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: kMainBorderRadius,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: kMainBorderRadius,
                      gradient: LinearGradient(
                        colors: gradientListColor(context: context),
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  )),
                  Positioned(
                    child: Center(
                      child: Container(
                        padding: kAllPadding / 2,
                        decoration: BoxDecoration(
                          borderRadius: kMainBorderRadius * 6,
                          color: backgroundColor(context: context),
                        ),
                        child: Icon(
                          Iconsax.play5,
                          color: primaryColor(context: context),
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    right: 0,
                    child: Padding(
                      padding: kAllPadding,
                      child: Row(
                        crossAxisAlignment: kCrossAxisAlignmentEnd(),
                        children: [
                          Text(
                            'One Piece',
                            style: headlineLarge(context: context).copyWith(
                              color: backgroundColor(
                                context: context,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Episode 54',
                            style: bodySmall(context: context).copyWith(
                              color: backgroundColor(
                                context: context,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            viewportFraction: 1,
          ),
        ),
        const SizedBox(height: 4),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: images.length,
          effect: ExpandingDotsEffect(
            dotColor: primaryColor(context: context).withOpacity(0.3),
            activeDotColor: primaryColor(context: context),
            dotHeight: 4,
            dotWidth: 8,
            spacing: 3,
          ),
          curve: Easing.legacy,
        ),
      ],
    );
  }
}
