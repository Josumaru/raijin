import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_bookmark_bloc/anime_bookmark_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_detail_bloc/anime_detail_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_history_bloc/anime_history_bloc.dart';
import 'package:raijin/features/anime/presentation/pages/detail_page.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class BookmarkWidget extends StatelessWidget {
  const BookmarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: kHorizontalPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: kCrossAxisAlignmentStart(),
              children: [
                Text(
                  'My Bookmark',
                  style: bodyLarge(context: context),
                ),
                BlocBuilder<AnimeBookmarkBloc, AnimeBookmarkState>(
                  builder: (context, state) {
                    final history = context.read<AnimeHistoryBloc>().state;
                    if (state.animeList.isEmpty) {
                      return SizedBox(
                        height: heightMediaQuery(context: context) * 0.85,
                        child: Center(
                          child: Text(
                            'No Anime Saved',
                            style: bodySmall(context: context),
                          ),
                        ),
                      );
                    }
                    return Column(
                      children: List.generate(
                        state.animeList.length,
                        (index) {
                          return SwipeableTile(
                            backgroundBuilder: (context, direction, progress) {
                              return Container();
                            },
                            color: backgroundColor(context: context),
                            onSwiped: (direction) {
                              if (direction == SwipeDirection.endToStart) {
                                context.read<AnimeBookmarkBloc>().add(
                                      AnimeBookmarkEvent.removeAnimeList(
                                        poster: state.animeList[index].poster
                                            .split('/')
                                            .last
                                            .trim(),
                                      ),
                                    );
                              }
                            },
                            key: UniqueKey(),
                            isElevated: false,
                            swipeThreshold: 0.2,
                            child: Padding(
                              padding: kTopPadding,
                              child: BookmarkCard(
                                animeModel: state.animeList[index],
                                videoModelList: history.videoList,
                              ),
                            ),
                          );
                        },
                      ).animate(interval: .055.seconds).slideY(begin: 1),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookmarkCard extends StatelessWidget {
  const BookmarkCard({
    super.key,
    required AnimeModel animeModel,
    required List<VideoModel> videoModelList,
  })  : _animeModel = animeModel,
        _videoModelList = videoModelList;
  final AnimeModel _animeModel;
  final List<VideoModel> _videoModelList;
  @override
  Widget build(BuildContext context) {
    int progress = 0;
    late String lastWatched = '0';
    late String historyTitle;
    late String animeTitle;
    late String historyBaseUrl;
    late String animeBaseUrl;
    late String historyPoster;
    late String animePoster;

    for (var history in List.from(_videoModelList.reversed)) {
      historyTitle = history.title.split('Episode').first.trim();
      animeTitle = _animeModel.title;
      historyBaseUrl =
          history.baseUrl.split(kAnimeEndpoint).last.replaceAll('/', '');
      animeBaseUrl = _animeModel.endpoint;
      historyPoster = history.poster;
      animePoster = _animeModel.poster;

      if (historyTitle == animeTitle ||
          historyBaseUrl == animeBaseUrl ||
          historyPoster == animePoster) {
        lastWatched = history.title.split('Episode').last.trim();
        progress = ((history.position! / history.duration!) * 100).round();
      }
    }
    return InkWell(
      onTap: () {
        _goToDetail(endpoint: animeBaseUrl, context: context);
      },
      borderRadius: kMainBorderRadius,
      child: CachedNetworkImage(
        imageUrl: '$kAnimeEndpoint${_animeModel.poster}',
        imageBuilder: (context, imageProvider) => Row(
          children: [
            Container(
              width: (widthMediaQuery(context: context) / 3) - (40 / 3),
              height: heightMediaQuery(context: context) / 4.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                borderRadius: kMainBorderRadius,
              ),
            ),
            Padding(
              padding: kLeftPadding,
              child: SizedBox(
                width: widthMediaQuery(context: context) * 0.6,
                height: heightMediaQuery(context: context) / 4.5,
                child: Column(
                  mainAxisAlignment: kMainAxisAligmentStart(),
                  crossAxisAlignment: kCrossAxisAlignmentStart(),
                  children: [
                    Text(
                      _animeModel.title,
                      style: bodyLarge(context: context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      _animeModel.endpoint,
                      style: bodyLarge(context: context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      lastWatched == '0'
                          ? ''
                          : 'Last Watch Episode $lastWatched | $progress%',
                      style: bodySmall(context: context),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

_goToDetail({required String endpoint, required BuildContext context}) {
  context.read<AnimeDetailBloc>().add(
        AnimeDetailEvent.animeGetDetail(endpoint: '$kAnimeEndpoint$endpoint'),
      );
  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
    context,
    screen: const DetailPage(),
    settings: const RouteSettings(name: '/detail'),
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
