import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_complete_bloc/anime_complete_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_history_bloc/anime_history_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_movie_bloc/anime_movie_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_new_bloc/anime_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_ongoing_bloc/anime_ongoing_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_popular_bloc/anime_popular_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_preferences/anime_preferences_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_video_bloc/anime_video_bloc.dart';
import 'package:raijin/features/anime/presentation/pages/video_page.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/anime_complete_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/anime_movie_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/anime_ongoing_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/anime_popular_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/carousel_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});
  final RefreshController _controller = RefreshController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SmartRefresher(
          enablePullDown: true,
          controller: _controller,
          header: ClassicHeader(
            idleIcon: Icon(
              Iconsax.direct_down,
              color: onBackgroundColor(context: context),
            ),
            releaseIcon: Icon(
              Iconsax.refresh,
              color: onBackgroundColor(context: context),
            ),
          ),
          onRefresh: () async {
            _refresh(context);
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: kMainAxisAligmentStart(),
              children: const [
                CarouselWidget(),
                AnimeHistoryWidget(),
                AnimeOngoingWidget(),
                AnimePopularWidget(),
                AnimeCompleteWidget(),
                AnimeMovieWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _refresh(BuildContext context) async {
    context.read<AnimeBloc>().add(const AnimeEvent.animeGetNew(page: 1));
    // context.read<AnimePreferencesBloc>()..add(Anime);
    context
        .read<AnimePopularBloc>()
        .add(const AnimePopularEvent.animeGetPopular(
          status: '',
          order: 'popular',
          type: '',
          genre: '',
          page: 1,
        ));
    context
        .read<AnimeOngoingBloc>()
        .add(const AnimeOngoingEvent.animeGetOngoing(
          status: 'Currently+Airing',
          order: 'latest',
          type: '',
          genre: '',
          page: 1,
        ));
    context
        .read<AnimeCompleteBloc>()
        .add(const AnimeCompleteEvent.animeGetComplete(
          status: 'Finished+Airing',
          order: 'latest',
          type: '',
          genre: '',
          page: 1,
        ));
    context.read<AnimeMovieBloc>().add(
          const AnimeMovieEvent.animeGetMovie(
            status: '',
            order: 'latest',
            type: 'Movie',
            genre: '',
            page: 1,
          ),
        );
    context
        .read<AnimeHistoryBloc>()
        .add(const AnimeHistoryEvent.getAnimeHistory());
    await Future.delayed(const Duration(seconds: 2), () {
      _controller.refreshCompleted();
    });
  }
}

class AnimeHistoryWidget extends StatelessWidget {
  const AnimeHistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeHistoryBloc, AnimeHistoryState>(
      builder: (context, state) {
        final double width = widthMediaQuery(context: context) / 3.5;
        final double height = width * (16 / 9);
        if (state.loading) {
          return Shimmer.fromColors(
            baseColor: onBackgroundColor(context: context).withOpacity(0.1),
            highlightColor:
                onBackgroundColor(context: context).withOpacity(0.3),
            child: Padding(
              padding: kHorizontalPadding,
              child: Column(
                crossAxisAlignment: kCrossAxisAlignmentStart(),
                children: [
                  Padding(
                    padding: kVerticalPadding,
                    child: Container(
                      width: width,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: kMainBorderRadius,
                        color: backgroundColor(context: context),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: kMainAxisAligmentStart(),
                    crossAxisAlignment: kCrossAxisAlignmentStart(),
                    children: [
                      Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                          borderRadius: kMainBorderRadius,
                          color: onBackgroundColor(context: context),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: kLeftPadding,
                          child: Column(
                            crossAxisAlignment: kCrossAxisAlignmentStart(),
                            children: [
                              Padding(
                                padding: kTopPadding,
                                child: Container(
                                  height: 18,
                                  decoration: BoxDecoration(
                                    borderRadius: kMainBorderRadius,
                                    color: backgroundColor(context: context),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: kTopPadding,
                                child: Container(
                                  height: 18,
                                  decoration: BoxDecoration(
                                    borderRadius: kMainBorderRadius,
                                    color: backgroundColor(context: context),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: kVerticalPadding,
                                child: Container(
                                  height: 18,
                                  decoration: BoxDecoration(
                                    borderRadius: kMainBorderRadius,
                                    color: backgroundColor(context: context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else if (state.videoList.isEmpty) {
          return Container();
        } else {
          final double width = widthMediaQuery(context: context) / 3.5;
          final double height = width * (16 / 9);
          final VideoModel anime = state.videoList.first;
          final int progress =
              ((anime.position! / anime.duration!) * 100).round();
          return Padding(
            padding: kHorizontalPadding,
            child: Column(
              crossAxisAlignment: kCrossAxisAlignmentStart(),
              children: [
                Text(
                  'Continue Watching',
                  style: bodyLarge(context: context),
                ),
                CachedNetworkImage(
                  imageUrl: '$kAnimeEndpoint${state.videoList.first.poster}',
                  errorWidget: (context, url, error) => _buildCachedLoading(
                    width,
                    height,
                    context,
                    anime,
                    progress,
                  ),
                  progressIndicatorBuilder: (context, url, imageProgress) =>
                      _buildCachedLoading(
                    width,
                    height,
                    context,
                    anime,
                    progress,
                  ),
                  imageBuilder: (context, imageProvider) {
                    return Row(
                      mainAxisAlignment: kMainAxisAligmentStart(),
                      crossAxisAlignment: kCrossAxisAlignmentStart(),
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: width,
                              height: height,
                              decoration: BoxDecoration(
                                borderRadius: kMainBorderRadius,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 5,
                              top: 5,
                              child: Container(
                                padding: kHorizontalPadding,
                                decoration: BoxDecoration(
                                  color: primaryColor(context: context),
                                  borderRadius: kMainBorderRadius / 4,
                                ),
                                child: Text(
                                  anime.quality,
                                  style: bodyMedium(context: context).copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            height: height,
                            child: Padding(
                              padding: kLeftPadding,
                              child: Column(
                                crossAxisAlignment: kCrossAxisAlignmentStart(),
                                children: [
                                  Text(
                                    anime.title.split('Episode ').first,
                                    style: bodyLarge(context: context),
                                  ),
                                  Text(
                                    anime.genre.first,
                                    style: bodySmall(context: context),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Episode ${anime.title.split('Episode ').last}',
                                    style: bodySmall(context: context),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        progress == 100 ? 'Done' : '$progress%',
                                        style: headlineLarge(context: context),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${((anime.duration! - anime.position!) / 60).round()} Minutes Left',
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 4,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          color: primaryColor(
                                            context: context,
                                          ).withOpacity(0.4),
                                          borderRadius: kMainBorderRadius,
                                        ),
                                      ),
                                      Container(
                                        height: 4,
                                        width:
                                            (widthMediaQuery(context: context) -
                                                    width) *
                                                anime.position! /
                                                anime.duration!,
                                        decoration: BoxDecoration(
                                          color: primaryColor(
                                            context: context,
                                          ),
                                          borderRadius: kMainBorderRadius,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: SizedBox(
                                      width: widthMediaQuery(context: context) -
                                          width,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _play(
                                            endpoint:
                                                '$kAnimeEndpoint${anime.endpoint}',
                                            context: context,
                                            baseUrl: anime.baseUrl,
                                          );
                                        },
                                        child: Text(
                                          progress == 100
                                              ? 'Replay'
                                              : 'Continue',
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ].animate(interval: .055.seconds).slideX(begin: 1),
            ),
          );
        }
      },
    );
  }

  Row _buildCachedLoading(double width, double height, BuildContext context,
      VideoModel anime, int progress) {
    return Row(
      mainAxisAlignment: kMainAxisAligmentStart(),
      crossAxisAlignment: kCrossAxisAlignmentStart(),
      children: [
        Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: kMainBorderRadius,
                  color: onBackgroundColor(context: context).withOpacity(0.5)),
            ),
            Positioned(
              left: 5,
              top: 5,
              child: Container(
                padding: kHorizontalPadding,
                decoration: BoxDecoration(
                  color: primaryColor(context: context),
                  borderRadius: kMainBorderRadius / 4,
                ),
                child: Text(
                  anime.quality,
                  style: bodyMedium(context: context).copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: SizedBox(
            height: height,
            child: Padding(
              padding: kLeftPadding,
              child: Column(
                crossAxisAlignment: kCrossAxisAlignmentStart(),
                children: [
                  Text(
                    anime.title.split('Episode ').first,
                    style: bodyLarge(context: context),
                  ),
                  Text(
                    anime.genre.first,
                    style: bodySmall(context: context),
                  ),
                  const Spacer(),
                  Text(
                    'Episode ${anime.title.split('Episode ').last}',
                    style: bodySmall(context: context),
                  ),
                  Row(
                    children: [
                      Text(
                        progress == 100 ? 'Done' : '$progress%',
                        style: headlineLarge(context: context),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${((anime.duration! - anime.position!) / 60).round()} Minutes Left',
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 4,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: primaryColor(
                            context: context,
                          ).withOpacity(0.4),
                          borderRadius: kMainBorderRadius,
                        ),
                      ),
                      Container(
                        height: 4,
                        width: (widthMediaQuery(context: context) - width) *
                            anime.position! /
                            anime.duration!,
                        decoration: BoxDecoration(
                          color: primaryColor(
                            context: context,
                          ),
                          borderRadius: kMainBorderRadius,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      width: widthMediaQuery(context: context) - width,
                      child: ElevatedButton(
                        onPressed: () {
                          _play(
                            endpoint: '$kAnimeEndpoint${anime.endpoint}',
                            context: context,
                            baseUrl: anime.baseUrl,
                          );
                        },
                        child: Text(
                          progress == 100 ? 'Replay' : 'Continue',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void _play({
  required String endpoint,
  required BuildContext context,
  required String baseUrl,
}) {
  context.read<AnimeVideoBloc>().add(AnimeVideoEvent.getVideo(
      endpoint: endpoint,
      baseUrl: baseUrl,
      position: 0,
      server: context.read<AnimePreferencesBloc>().state.preferences.server!));
  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
    context,
    withNavBar: false,
    screen: const VideoPage(),
    settings: const RouteSettings(name: '/video'),
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
