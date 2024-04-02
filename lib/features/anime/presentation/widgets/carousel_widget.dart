import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key, required this.animeModel});

  final List<AnimeModel> animeModel;
  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<AnimeModel> animeModel = widget.animeModel;
    return Column(
      mainAxisAlignment: kMainAxisAligmentStart(),
      crossAxisAlignment: kCrossAxisAlignmentStart(),
      children: [
        const SizedBox(height: 4),
        Padding(
          padding: kLeftPadding,
          child: Text(
            'Latest Anime Update',
            style: headlineLarge(context: context).copyWith(
              color: onBackgroundColor(context: context),
            ),
          ),
        ),
        const SizedBox(height: 10),
        CarouselSlider.builder(
          itemCount: animeModel.length,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: kHorizontalPadding,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: kMainBorderRadius,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          animeModel[index].poster,
                        ),
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
                  const Positioned(
                    child: Center(
                      child: Icon(
                        Iconsax.play,
                        color: kMainDarkTextColor,
                        size: 40,
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
                          Expanded(
                            child: Text(
                              animeModel[index].title.split('Episode')[0],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: headlineLarge(context: context).copyWith(
                                color: kMainDarkTextColor,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            animeModel[index].episode!,
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
        SizedBox(
          width: widthMediaQuery(context: context),
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: animeModel.length,
              effect: ExpandingDotsEffect(
                dotColor: primaryColor(context: context).withOpacity(0.3),
                activeDotColor: primaryColor(context: context),
                dotHeight: 4,
                dotWidth: 8,
                spacing: 3,
              ),
              curve: Easing.legacy,
            ),
          ),
        ),
      ],
    );
  }
}
