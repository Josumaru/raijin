import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_history_bloc/anime_history_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_preferences/anime_preferences_bloc.dart';
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
              final double width = widthMediaQuery(context: context) / 2.5;
              final double height = width * (9 / 16);
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
                crossAxisAlignment: kCrossAxisAlignmentStart(),
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
                            errorWidget: (context, url, error) {
                              return _buildError(
                                width,
                                height,
                                context,
                                video,
                                index,
                                state,
                              );
                            },
                            progressIndicatorBuilder: (context, url, progress) {
                              return _buildError(
                                width,
                                height,
                                context,
                                video,
                                index,
                                state,
                              );
                            },
                            imageBuilder: (context, imageProvider) {
                              final double width =
                                  widthMediaQuery(context: context) / 2.5;
                              final double height = width * (9 / 16);
                              return Stack(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        kCrossAxisAlignmentStart(),
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
                                                  borderRadius:
                                                      kMainBorderRadius,
                                                  color: Colors.white
                                                      .withOpacity(0.6),
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
                                                              (context,
                                                                      index) =>
                                                                  SettingItemWidget(
                                                                select:
                                                                    'Delete from history',
                                                                option: '',
                                                                icon: Iconsax
                                                                    .trash,
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
                                                  color:
                                                      kMainLightBackgroundColor
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
                                                style:
                                                    bodySmall(context: context),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Positioned.fill(child: InkWell(
                                    onTap: () {
                                      _play(
                                        endpoint:
                                            '$kAnimeEndpoint${video[index].endpoint}',
                                        context: context,
                                        baseUrl: state.videoList.first.baseUrl,
                                        position:
                                            state.videoList.first.position!,
                                      );
                                    },
                                  )),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }).animate(interval: .055.seconds).slideX(begin: 1),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Stack _buildError(double width, double height, BuildContext context,
      List<VideoModel> video, int index, AnimeHistoryState state) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: kCrossAxisAlignmentStart(),
          children: [
            Container(
              width: width,
              height: height,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
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
                        color: kMainDarkTextColor.withOpacity(0.7),
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
                        color: kMainDarkTextColor.withOpacity(0.7),
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
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Column(
                      crossAxisAlignment: kCrossAxisAlignmentStart(),
                      children: [
                        const Spacer(),
                        Container(
                          width: width *
                              video[index].position! /
                              video[index].duration!,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: kMainBorderRadius,
                            color: primaryColor(
                              context: context,
                            ),
                          ),
                        )
                      ],
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
                                backgroundColor: backgroundColor(
                                  context: context,
                                ),
                                surfaceTintColor: onBackgroundColor(
                                  context: context,
                                ),
                                mainContentSlivers: [
                                  SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                    childCount: 1,
                                    (context, index) => SettingItemWidget(
                                      select: 'Delete from history',
                                      option: '',
                                      icon: Iconsax.trash,
                                      callback: () {
                                        context.read<AnimeHistoryBloc>().add(
                                              AnimeHistoryEvent
                                                  .deleteAnimeHistory(
                                                      endpoint:
                                                          video[index].baseUrl),
                                            );
                                        context.read<AnimeHistoryBloc>().add(
                                              const AnimeHistoryEvent
                                                  .getAnimeHistory(),
                                            );
                                        Navigator.of(context).pop();
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
                        color: kMainLightBackgroundColor.withOpacity(0.7),
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
                  crossAxisAlignment: kCrossAxisAlignmentStart(),
                  children: [
                    Text(
                      state.videoList[index].title.split('Episode ').first,
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
        ),
        Positioned.fill(child: InkWell(
          onTap: () {
            _play(
              endpoint: '$kAnimeEndpoint${video[index].endpoint}',
              context: context,
              baseUrl: state.videoList.first.baseUrl,
              position: state.videoList.first.position!,
            );
          },
        )),
      ],
    );
  }
}

_play({
  required String endpoint,
  required BuildContext context,
  required String baseUrl,
  required int position,
}) {
  context.read<AnimeVideoBloc>().add(AnimeVideoEvent.getVideo(
        endpoint: endpoint,
        baseUrl: baseUrl,
        position: position,
        server: context.read<AnimePreferencesBloc>().state.preferences.server!,
      ));
  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
    context,
    withNavBar: false,
    screen: const VideoPage(),
    settings: const RouteSettings(name: '/video'),
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
