import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
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
import 'package:raijin/features/anime/presentation/blocs/anime_history_bloc/anime_history_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_video_bloc/anime_video_bloc.dart';
import 'package:raijin/features/anime/presentation/pages/video_page.dart';
import 'package:raijin/features/anime/presentation/widgets/user_widgets/setting_item_widget.dart';
import 'package:swipeable_tile/swipeable_tile.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<AnimeHistoryBloc, AnimeHistoryState>(
            builder: (context, state) {
              if (state.videoList.isEmpty) {
                return SizedBox(
                  height: heightMediaQuery(context: context) * 0.85,
                  child: Center(
                    child: Text(
                      'No History',
                      style: bodySmall(context: context),
                    ),
                  ),
                );
              }
              return Column(
                children: [
                  Padding(
                    padding: kLeftPadding,
                    child: Text(
                      'Watching History',
                      style: bodyLarge(context: context),
                    ),
                  ),
                  Column(
                    children: List.generate(state.videoList.length, (index) {
                      final List<VideoModel> video = state.videoList;
                      return SwipeableTile(
                        backgroundBuilder: (context, direction, progress) {
                          return Container();
                        },
                        color: backgroundColor(context: context),
                        onSwiped: (direction) {
                          if (direction == SwipeDirection.endToStart) {
                            context.read<AnimeHistoryBloc>().add(
                                  AnimeHistoryEvent.deleteAnimeHistory(
                                    endpoint: state.videoList[index].baseUrl,
                                  ),
                                );
                            context
                                .read<AnimeHistoryBloc>()
                                .add(const AnimeHistoryEvent.getAnimeHistory());
                          }
                        },
                        key: UniqueKey(),
                        isElevated: false,
                        swipeThreshold: 0.2,
                        child: Padding(
                          padding: kHorizontalTopPadding,
                          child: CachedNetworkImage(
                            imageUrl: state.videoList[index].thumbnail,
                            imageBuilder: (context, imageProvider) {
                              final double width =
                                  widthMediaQuery(context: context) / 2.5;
                              final double height = width * (9 / 16);
                              return Row(
                                crossAxisAlignment: kCrossAxisAlignmentStart(),
                                children: [
                                  Container(
                                    width: width,
                                    height: height,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: kMainBorderRadius,
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: gradientListColor(
                                                  context: context,
                                                ),
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          left: 5,
                                          child: Text(
                                            '${(video[index].position! ~/ 60).toString().padLeft(2, '0')}:${(video[index].position! % 60).toString().padLeft(2, '0')}',
                                            style: TextStyle(
                                              color: kMainDarkTextColor
                                                  .withOpacity(0.7),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: Text(
                                            'Episode ${video[index].title.split('Episode').last.trim()}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: kMainDarkTextColor
                                                  .withOpacity(0.7),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          child: Container(
                                            width: width,
                                            height: 3,
                                            decoration: BoxDecoration(
                                              borderRadius: kMainBorderRadius,
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Column(
                                            crossAxisAlignment:
                                                kCrossAxisAlignmentStart(),
                                            children: [
                                              const Spacer(),
                                              Container(
                                                width: width *
                                                    video[index].position! /
                                                    video[index].duration!,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      kMainBorderRadius,
                                                  color: primaryColor(
                                                    context: context,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: InkWell(
                                            onTap: () {
                                              context
                                                  .read<AnimeVideoBloc>()
                                                  .add(
                                                    AnimeVideoEvent.getVideo(
                                                        endpoint:
                                                            '$kAnimeEndpoint${video[index].baseUrl}',
                                                        baseUrl: state.videoList
                                                            .first.baseUrl),
                                                  );
                                              _play(
                                                endpoint:
                                                    '$kAnimeEndpoint${video[index].endpoint}',
                                                animeModel: AnimeModel(
                                                  title: video[index].title,
                                                  endpoint:
                                                      video[index].endpoint,
                                                  poster: video[index].poster,
                                                ),
                                                context: context,
                                                baseUrl: state
                                                    .videoList.first.baseUrl,
                                              );
                                            },
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 5,
                                          child: InkWell(
                                            borderRadius: kMainBorderRadius,
                                            onTap: () {
                                              WoltModalSheet.show(
                                                context: context,
                                                pageListBuilder: (context) {
                                                  return [
                                                    SliverWoltModalSheetPage(
                                                      backgroundColor:
                                                          backgroundColor(
                                                        context: context,
                                                      ),
                                                      surfaceTintColor:
                                                          onBackgroundColor(
                                                        context: context,
                                                      ),
                                                      mainContentSlivers: [
                                                        SliverList(
                                                            delegate:
                                                                SliverChildBuilderDelegate(
                                                          childCount: 1,
                                                          (context, index) =>
                                                              SettingItemWidget(
                                                            select:
                                                                'Delete from history',
                                                            option: '',
                                                            icon: Iconsax.trash,
                                                            callback: () {
                                                              context
                                                                  .read<
                                                                      AnimeHistoryBloc>()
                                                                  .add(
                                                                    AnimeHistoryEvent.deleteAnimeHistory(
                                                                        endpoint:
                                                                            video[index].baseUrl),
                                                                  );
                                                              context
                                                                  .read<
                                                                      AnimeHistoryBloc>()
                                                                  .add(
                                                                    const AnimeHistoryEvent
                                                                        .getAnimeHistory(),
                                                                  );
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        )),
                                                      ],
                                                    )
                                                  ];
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Iconsax.more,
                                              color: kMainLightBackgroundColor
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: kLeftPadding,
                                      child: Column(
                                        crossAxisAlignment:
                                            kCrossAxisAlignmentStart(),
                                        children: [
                                          Text(
                                            state.videoList[index].title
                                                .split('Episode ')
                                                .first,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            'Episode ${state.videoList[index].title.split('Episode ').last}',
                                            style: bodySmall(context: context),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

_play({
  required String endpoint,
  required AnimeModel animeModel,
  required BuildContext context,
  required String baseUrl,
}) {
  context
      .read<AnimeVideoBloc>()
      .add(AnimeVideoEvent.getVideo(endpoint: endpoint, baseUrl: baseUrl));
  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
    context,
    screen: const VideoPage(),
    settings: const RouteSettings(name: '/video'),
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
