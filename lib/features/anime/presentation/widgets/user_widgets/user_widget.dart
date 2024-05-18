import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:raijin/core/commons/widgets/anime_card_shimmer_widget.dart';
import 'package:raijin/core/commons/widgets/anime_card_widget.dart';
import 'package:raijin/core/commons/widgets/anime_video_description_button.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_history_bloc/anime_history_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_bookmark_bloc/anime_bookmark_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_video_bloc/anime_video_bloc.dart';
import 'package:raijin/features/anime/presentation/pages/bookmark_page.dart';
import 'package:raijin/features/anime/presentation/pages/video_page.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/anime_ongoing_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/user_widgets/setting_item_widget.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class UserWidget extends StatelessWidget {
  UserWidget({super.key});
  final RefreshController _controller = RefreshController();

  @override
  Widget build(BuildContext context) {
    final user = sl<FirebaseAuth>().currentUser!;

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
          child: CachedNetworkImage(
              imageUrl:
                  'https://about.vidio.com/wp-content/uploads/2022/04/KAGUYA-SHINOMIYA.jpg',
              imageBuilder: (context, imageProvider) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      foregroundColor: onBackgroundColor(context: context),
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(
                          heightMediaQuery(context: context) * 0.15,
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: heightMediaQuery(context: context) *
                                      0.075,
                                ),
                                Container(
                                  height: heightMediaQuery(context: context) *
                                      0.075,
                                  decoration: BoxDecoration(
                                    color: backgroundColor(context: context),
                                    borderRadius: kTopBorderRadius,
                                  ),
                                  child: Padding(
                                    padding: kRightPadding,
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        OutlinedButton(
                                          onPressed: () {},
                                          child: Padding(
                                            padding: kHorizontalPadding * 2,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: kRightPadding,
                                                  child: const Icon(
                                                    Iconsax.edit,
                                                    size: 16,
                                                  ),
                                                ),
                                                const Text('Edit'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: kLeftPadding,
                              height: heightMediaQuery(context: context) * 0.15,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: imageProvider,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      scrolledUnderElevation: 0,
                      expandedHeight: heightMediaQuery(context: context) * 0.2,
                      flexibleSpace: FlexibleSpaceBar(
                        background: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Image(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: kTopPadding,
                        decoration: BoxDecoration(
                          borderRadius: kMainBorderRadius,
                        ),
                        child: Column(
                          crossAxisAlignment: kCrossAxisAlignmentStart(),
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  'https://about.vidio.com/wp-content/uploads/2022/04/KAGUYA-SHINOMIYA.jpg',
                              imageBuilder: (context, imageProvider) {
                                return Column(
                                  crossAxisAlignment:
                                      kCrossAxisAlignmentStart(),
                                  children: [
                                    Padding(
                                      padding: kLeftPadding,
                                      child: Text(
                                        user.displayName!,
                                        style: bodyLarge(context: context),
                                      ),
                                    ),
                                    Padding(
                                      padding: kHorizontalPadding,
                                      child: Text(
                                        user.email!,
                                        style: bodySmall(context: context),
                                      ),
                                    ),
                                    Padding(
                                      padding: kHorizontalPadding,
                                      child: Text(
                                        user.uid,
                                        style: bodySmall(context: context),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          kMainAxisAligmentSpaceEvenly(),
                                      children: [
                                        AnimeVideoDescriptionButton(
                                          icon: Iconsax.direct_normal,
                                          text: 'My Download',
                                          callback: () {},
                                        ),
                                        AnimeVideoDescriptionButton(
                                          icon: Iconsax.save_2,
                                          text: 'My List',
                                          callback: () {
                                            _goToBookmark(context);
                                          },
                                        ),
                                        AnimeVideoDescriptionButton(
                                          icon: Iconsax.danger,
                                          text: 'Error Reporting',
                                          callback: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                            BlocBuilder<AnimeHistoryBloc, AnimeHistoryState>(
                              builder: (context, state) {
                                final List<VideoModel> video = state.videoList;
                                final int length = state.videoList.length;
                                return state.videoList.isNotEmpty
                                    ? Column(
                                        crossAxisAlignment:
                                            kCrossAxisAlignmentStart(),
                                        children: [
                                          _buildDivider(context),
                                          SettingItemWidget(
                                            select: 'History',
                                            option: 'See All',
                                            icon: Iconsax.timer,
                                            callback: () {},
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: List.generate(
                                                length,
                                                (index) {
                                                  const double width = 160;
                                                  const double height = 80;
                                                  return Container(
                                                    padding: index == 0
                                                        ? kLeftPadding
                                                        : index == length - 1
                                                            ? EdgeInsets.only(
                                                                right: kPadding,
                                                                left: kPadding *
                                                                    0.5)
                                                            : kLeftPadding / 2,
                                                    width: width,
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          video[index].poster,
                                                      imageBuilder: (context,
                                                          imageProvider) {
                                                        return Column(
                                                          mainAxisAlignment:
                                                              kMainAxisAligmentStart(),
                                                          crossAxisAlignment:
                                                              kCrossAxisAlignmentStart(),
                                                          children: [
                                                            Container(
                                                              // width: width,
                                                              height: height,
                                                              clipBehavior:
                                                                  Clip.hardEdge,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  image:
                                                                      imageProvider,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                                borderRadius:
                                                                    kMainBorderRadius,
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Positioned
                                                                      .fill(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors:
                                                                              gradientListColor(
                                                                            context:
                                                                                context,
                                                                          ),
                                                                          begin:
                                                                              Alignment.topCenter,
                                                                          end: Alignment
                                                                              .bottomCenter,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    bottom: 5,
                                                                    left: 5,
                                                                    child: Text(
                                                                      '${(video[index].position! ~/ 60).toString().padLeft(2, '0')}:${(video[index].position! % 60).toString().padLeft(2, '0')}',
                                                                      style:
                                                                          TextStyle(
                                                                        color: kMainDarkTextColor
                                                                            .withOpacity(0.7),
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    bottom: 5,
                                                                    right: 5,
                                                                    child: Text(
                                                                      'Episode ${video[index].title.split('Episode').last.trim()}',
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style:
                                                                          TextStyle(
                                                                        color: kMainDarkTextColor
                                                                            .withOpacity(0.7),
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    bottom: 0,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          width,
                                                                      height: 3,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            kMainBorderRadius,
                                                                        color: Colors
                                                                            .white
                                                                            .withOpacity(0.6),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned
                                                                      .fill(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          kCrossAxisAlignmentStart(),
                                                                      children: [
                                                                        const Spacer(),
                                                                        Container(
                                                                          width: width *
                                                                              video[index].position! /
                                                                              video[index].duration!,
                                                                          height:
                                                                              3,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                kMainBorderRadius,
                                                                            color:
                                                                                primaryColor(
                                                                              context: context,
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Positioned
                                                                      .fill(
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        context
                                                                            .read<AnimeVideoBloc>()
                                                                            .add(
                                                                              AnimeVideoEvent.getVideo(endpoint: '$kAnimeEndpoint${video[index].baseUrl}', baseUrl: state.videoList.first.baseUrl),
                                                                            );
                                                                        _play(
                                                                          endpoint:
                                                                              '$kAnimeEndpoint${video[index].baseUrl}',
                                                                          animeModel:
                                                                              AnimeModel(
                                                                            title:
                                                                                video[index].title,
                                                                            endpoint:
                                                                                video[index].endpoint,
                                                                            poster:
                                                                                video[index].poster,
                                                                          ),
                                                                          context:
                                                                              context,
                                                                              baseUrl: state.videoList.first.baseUrl,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    top: 0,
                                                                    right: 5,
                                                                    child:
                                                                        InkWell(
                                                                      borderRadius:
                                                                          kMainBorderRadius,
                                                                      onTap:
                                                                          () {
                                                                        WoltModalSheet
                                                                            .show(
                                                                          context:
                                                                              context,
                                                                          pageListBuilder:
                                                                              (context) {
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
                                                                                              AnimeHistoryEvent.deleteAnimeHistory(endpoint: video[index].baseUrl),
                                                                                            );
                                                                                        context.read<AnimeHistoryBloc>().add(
                                                                                              const AnimeHistoryEvent.getAnimeHistory(),
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
                                                                      child:
                                                                          Icon(
                                                                        Iconsax
                                                                            .more,
                                                                        color: kMainLightBackgroundColor
                                                                            .withOpacity(0.7),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Text(
                                                              video[index]
                                                                  .title
                                                                  .split(
                                                                      'Episode')
                                                                  .first
                                                                  .trim(),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox();
                              },
                            ),
                            _buildDivider(context),
                            const AnimeOngoingWidget(
                              title: 'Ongoing',
                            ),
                            Padding(
                              padding: kHorizontalTopPadding,
                              child: Text(
                                'Preferences',
                                style: bodyLarge(context: context).copyWith(
                                  color: onBackgroundColor(context: context)
                                      .withOpacity(0.5),
                                ),
                              ),
                            ),
                            SettingItemWidget(
                              select: 'Theme',
                              option: 'Dark',
                              icon: Iconsax.brush_1,
                              callback: () {},
                            ),
                            SettingItemWidget(
                              select: 'Video Resolution',
                              option: '720p',
                              icon: Iconsax.play,
                              callback: () {},
                            ),
                            SettingItemWidget(
                              select: 'Playback Speed',
                              option: '1.0X',
                              icon: Iconsax.timer_start,
                              callback: () {},
                            ),
                            SettingItemWidget(
                              select: 'Clear Cache',
                              option: '44MB',
                              icon: Iconsax.trash,
                              callback: () {},
                            ),
                            Padding(
                              padding: kHorizontalTopPadding,
                              child: Text(
                                'Apps',
                                style: bodyLarge(context: context).copyWith(
                                  color: onBackgroundColor(context: context)
                                      .withOpacity(0.5),
                                ),
                              ),
                            ),
                            SettingItemWidget(
                              select: 'Raijin',
                              option: 'Github',
                              icon: Iconsax.flash_14,
                              callback: () {},
                            ),
                            SettingItemWidget(
                              select: 'Samehadaku',
                              option: 'samehadaku.care',
                              icon: Iconsax.global,
                              callback: () {},
                            ),
                            SettingItemWidget(
                              select: 'Kraken',
                              option: 'krakenfiles.com',
                              icon: Iconsax.broom,
                              callback: () {},
                            ),
                            Padding(
                              padding: kHorizontalTopPadding,
                              child: Text(
                                'Account',
                                style: bodyLarge(context: context).copyWith(
                                  color: onBackgroundColor(context: context)
                                      .withOpacity(0.5),
                                ),
                              ),
                            ),
                            SettingItemWidget(
                              select: 'Log Out',
                              option: user.email!,
                              icon: Iconsax.export,
                              callback: () {
                                sl<AuthBloc>()
                                    .add(const AuthEvent.authLogout());
                                Navigator.of(context).popAndPushNamed('/auth');
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }

  Container _buildDivider(BuildContext context) {
    return Container(
      margin: kMainPadding,
      width: widthMediaQuery(context: context) - 2 * kPadding,
      height: 1,
      color: onBackgroundColor(context: context).withOpacity(0.1),
    );
  }

  _refresh(BuildContext context) async {
    context.read<AnimeHistoryBloc>().add(
          const AnimeHistoryEvent.getAnimeHistory(),
        );
    await Future.delayed(const Duration(seconds: 2), () {
      _controller.refreshCompleted();
    });
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
}

_goToBookmark(BuildContext context) {
  context
      .read<AnimeBookmarkBloc>()
      .add(const AnimeBookmarkEvent.getAnimeList());
  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
    context,
    screen: const BookmarkPage(),
    settings: const RouteSettings(name: '/bookmark'),
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
