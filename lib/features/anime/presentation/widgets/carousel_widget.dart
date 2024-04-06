import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_new_bloc/anime_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeBloc, AnimeState>(
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => _buildLoading(),
          loaded: (animeModel) => _buildLoaded(context, animeModel),
          error: (message) => Text(message),
        );
      },
    );
    // return
  }

  _buildLoading() {
    return Shimmer.fromColors(
      baseColor: onBackgroundColor(context: context).withOpacity(0.1),
      highlightColor: onBackgroundColor(context: context).withOpacity(0.3),
      child: Column(
        mainAxisAlignment: kMainAxisAligmentStart(),
        crossAxisAlignment: kCrossAxisAlignmentStart(),
        children: [
          const SizedBox(height: 4),
          Padding(
            padding: kLeftPadding,
            child: Container(
              width: 140,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: kMainBorderRadius / 2,
                gradient: LinearGradient(
                  colors: gradientListColor(context: context),
                ),
                color: backgroundColor(context: context),
              ),
            ),
          ),
          const SizedBox(height: 10),
          CarouselSlider.builder(
            itemCount: 1,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: kHorizontalPadding,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: kMainBorderRadius,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: kMainBorderRadius,
                          gradient: LinearGradient(
                            colors: gradientListColor(context: context),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      child: Center(
                        child: Icon(
                          Iconsax.play,
                          color: kMainDarkTextColor,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: false,
              viewportFraction: 1,
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: widthMediaQuery(context: context),
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: 1,
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
      ),
    );
    // return Padding(
    //   padding: kHorizontalPadding,
    //   child: Shimmer.fromColors(
    //     baseColor: const Color.fromARGB(255, 34, 34, 34),
    //     highlightColor: const Color.fromARGB(255, 65, 65, 65),
    //     child: Column(
    //       children: [
    //         Container(
    //           width: 120,
    //           height: 25,
    //           decoration: BoxDecoration(
    //             color: backgroundColor(context: context),
    //             borderRadius: kMainBorderRadius,
    //           ),
    //         ),
    //         Container(
    //           width: widthMediaQuery(context: context),
    //           height: 90,
    //           decoration: BoxDecoration(
    //             borderRadius: kMainBorderRadius,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  _buildLoaded(BuildContext context, List<AnimeModel>? animeModel) {
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
          itemCount: animeModel!.length,
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
                              color: kMainDarkTextColor,
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
