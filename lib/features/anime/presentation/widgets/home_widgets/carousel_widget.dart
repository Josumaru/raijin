import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_new_bloc/anime_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_video_bloc/anime_video_bloc.dart';
import 'package:raijin/features/anime/presentation/pages/video_page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeBloc, AnimeState>(
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => CarouselLoading(
            context: context,
          ),
          loaded: (animeModel) => CarouselLoaded(
            animeModel: animeModel!,
          ),
          error: (message) => Text(message),
        );
      },
    );
    // return
  }
}

class CarouselLoaded extends StatefulWidget {
  const CarouselLoaded({
    super.key,
    required List<AnimeModel> animeModel,
  }) : _animeModel = animeModel;
  final List<AnimeModel> _animeModel;

  @override
  State<CarouselLoaded> createState() => _CarouselLoadedState();
}

class _CarouselLoadedState extends State<CarouselLoaded> {
  late int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<AnimeModel> animeModel = widget._animeModel;
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
            return InkWell(
              borderRadius: kMainBorderRadius,
              onTap: () {
                _play(endpoint: animeModel[index].endpoint);
              },
              child: Padding(
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
                              'Episode ${animeModel[index].episode!}',
                              style: bodySmall(context: context).copyWith(
                                color: kMainDarkTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: kAllPadding,
                        child: Text(
                          animeModel[index].released!,
                          style: bodySmall(context: context).copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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

  _play({required String endpoint}) {
    context
        .read<AnimeVideoBloc>()
        .add(AnimeVideoEvent.getVideo(endpoint: endpoint));
    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(context,
        screen: const VideoPage(),
        settings: const RouteSettings(name: '/video'),
        pageTransitionAnimation: PageTransitionAnimation.cupertino);
  }
}

class CarouselLoading extends StatelessWidget {
  const CarouselLoading({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
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
                borderRadius: kMainBorderRadius,
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
                            color: backgroundColor(context: context)),
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
                activeIndex: 0,
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
  }
}
