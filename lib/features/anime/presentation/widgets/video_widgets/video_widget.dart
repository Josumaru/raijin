// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:raijin/core/commons/widgets/loading_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/episode_model/episode_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_video_bloc/anime_video_bloc.dart';
import 'package:shimmer/shimmer.dart';

class VideoWidget extends StatelessWidget {
  VideoWidget({super.key});

  bool initialized = false;
  late VideoPlayerController controller;
  int showControlDuration = 0;
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    final AnimeVideoBloc bloc = context.read<AnimeVideoBloc>();
    final double devicesWidth = widthMediaQuery(context: context);
    final double? width;
    final double? height;
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool landscape = orientation == Orientation.landscape;

    // change width and height when orientation is changed, trigered when rebuild widget
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      width = widthMediaQuery(context: context);
      height = heightMediaQuery(context: context);
    } else {
      width = null;
      height = null;
    }

    // Change to !orientation
    void setOrientation() {
      if (orientation == Orientation.portrait) {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.immersiveSticky,
          overlays: [SystemUiOverlay.bottom],
        );
        SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft],
        );
      } else {
        SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
        );
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.edgeToEdge,
          overlays: [SystemUiOverlay.bottom],
        );
      }
    }

    // Set showControllDuration -1 every seconds
    void autoHideControl() {
      const seconds = Duration(seconds: 1);
      timer = Timer.periodic(seconds, (Timer timer) {
        if (showControlDuration > 0) {
          showControlDuration -= 1;
        } else {
          timer.cancel();
        }
      });
    }

    // hide video controll
    void hideControll(bool showControll) {
      bloc.add(
        AnimeVideoEvent.showControl(
          showControl: !showControll,
        ),
      );
    }

    // Build the controll
    buildVideoControll() {
      return BlocBuilder<AnimeVideoBloc, AnimeVideoState>(
        builder: (context, state) {
          final bool buffering = state.buffering;
          final bool playing = state.playing;
          final bool showControll = state.showControll;
          final int position = state.videoPosition;
          final int duration = state.videoDuration;
          final double sliderPosition = position / duration;
          final bool initialize = state.initialize;
          final bool loading = state.loading;
          void play() {
            bloc.add(AnimeVideoEvent.playVideo(isPlay: playing));
          }

          if (loading) {
            return const SizedBox();
          } else {
            final String poster = state.videoList.first.poster;

            // when initialize and loading state become false, then play video based on playing state
            if (!initialize && !loading) {
              if (playing) {
                controller.play();
                Wakelock.enable();
              } else {
                controller.pause();
                Wakelock.disable();
              }
            }

            return GestureDetector(
              onTap: () {
                hideControll(showControll);
                showControlDuration = 3;
                autoHideControl();
              },
              child: Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: () {
                    if (initialize) {
                      return Stack(
                        children: [
                          Center(
                            child: CachedNetworkImage(imageUrl: poster),
                          ),
                          const Positioned.fill(child: LoadingWidget())
                        ],
                      );
                    } else {
                      if (showControll) {
                        return Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: gradientColor(context: context),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Row(
                                crossAxisAlignment: kCrossAxisAlignmentCenter(),
                                children: [
                                  SizedBox(
                                    width: devicesWidth / 3,
                                    child: const Icon(
                                      Iconsax.previous,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: devicesWidth / 3,
                                    child: InkWell(
                                      onTap: play,
                                      child: () {
                                        // Show when the video is not buffering
                                        if (!buffering) {
                                          if (playing) {
                                            return const Icon(
                                              Iconsax.pause,
                                              color: Colors.white,
                                            );
                                          } else {
                                            return const Icon(
                                              Iconsax.play,
                                              color: Colors.white,
                                            );
                                          }
                                        }
                                      }(),
                                    ),
                                  ),
                                  SizedBox(
                                    width: devicesWidth / 3,
                                    child: const Icon(
                                      Iconsax.next,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Column(
                                crossAxisAlignment: kCrossAxisAlignmentStart(),
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(seconds: 1),
                                    width: widthMediaQuery(context: context),
                                    child: Padding(
                                      padding: kAllPadding,
                                      child: Row(
                                        children: [
                                          Text(
                                            '${(position ~/ 60).toString().padLeft(2, '0')}:${(position % 60).toString().padLeft(2, '0')}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '-${((duration - position) ~/ 60).toString().padLeft(2, '0')}:${((duration - position) % 60).toString().padLeft(2, '0')}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 35,
                                        width:
                                            widthMediaQuery(context: context),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.1),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35,
                                        width:
                                            widthMediaQuery(context: context),
                                        child: ClipRRect(
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 20,
                                              sigmaY: 20,
                                            ),
                                            child: Padding(
                                              padding: kHorizontalPadding,
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      controller.seekTo(
                                                        Duration(
                                                          seconds:
                                                              position + 88,
                                                        ),
                                                      );
                                                    },
                                                    borderRadius:
                                                        kMainBorderRadius,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          kMainAxisAligmentCenter(),
                                                      children: const [
                                                        Text('+90s'),
                                                      ],
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  InkWell(
                                                    onTap: setOrientation,
                                                    child: Padding(
                                                      padding:
                                                          kHorizontalPadding,
                                                      child: const Icon(
                                                        Iconsax.maximize_2,
                                                        size: 16,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                            width: widthMediaQuery(
                                                context: context),
                                            child: SliderTheme(
                                              data: SliderTheme.of(context)
                                                  .copyWith(
                                                trackHeight: 20,
                                                overlayShape:
                                                    const RoundSliderOverlayShape(
                                                  overlayRadius: 0,
                                                ),
                                                thumbShape:
                                                    const RoundSliderThumbShape(
                                                  elevation: 0,
                                                  enabledThumbRadius: 0,
                                                  disabledThumbRadius: 0,
                                                ),
                                                activeTrackColor:
                                                    Colors.transparent,
                                                inactiveTrackColor:
                                                    Colors.transparent,
                                                thumbColor: Colors.transparent,
                                              ),
                                              child: Slider(
                                                value: 0,
                                                onChanged: (value) {
                                                  bloc.add(
                                                    AnimeVideoEvent.setPosition(
                                                      position:
                                                          (value * duration)
                                                              .round(),
                                                      duration: duration,
                                                    ),
                                                  );
                                                },
                                                onChangeEnd: (value) {
                                                  bloc.add(AnimeVideoEvent
                                                      .seekPosition(
                                                          position: value));
                                                  controller.seekTo(Duration(
                                                      seconds:
                                                          (value * duration)
                                                              .round()));
                                                },
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 3,
                                            width: widthMediaQuery(
                                                context: context),
                                            decoration: const BoxDecoration(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          Container(
                                            height: 3,
                                            width: widthMediaQuery(
                                                    context: context) *
                                                sliderPosition,
                                            decoration: BoxDecoration(
                                              color: primaryColor(
                                                  context: context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                child: Padding(
                              padding: kMainPadding,
                              child: Row(
                                crossAxisAlignment: kCrossAxisAlignmentCenter(),
                                children: [
                                  InkWell(
                                    borderRadius: kMainBorderRadius,
                                    onTap: () {
                                      if (orientation ==
                                          Orientation.landscape) {
                                        setOrientation();
                                      } else {
                                        Navigator.of(context).pop();
                                      }
                                    },
                                    child: const Icon(
                                      Iconsax.arrow_left_2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  () {
                                    if (landscape) {
                                      return Text(
                                        state.videoList.first.title,
                                        style: bodyLarge(context: context),
                                      );
                                    }
                                    return const SizedBox();
                                  }(),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      WoltModalSheet.show(
                                        context: context,
                                        pageListBuilder: (context) {
                                          final List<VideoModel> videoList =
                                              state.videoList;
                                          return [
                                            SliverWoltModalSheetPage(
                                              backgroundColor: backgroundColor(
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
                                                    childCount:
                                                        videoList.length,
                                                    (context, index) {
                                                      return InkWell(
                                                        onTap: () {},
                                                        borderRadius:
                                                            kMainBorderRadius,
                                                        child: Center(
                                                          child: Padding(
                                                            padding:
                                                                kAllPadding,
                                                            child: Text(
                                                              videoList[index]
                                                                  .quality,
                                                                // style: (){
                                                                //   // if(state.mirror)
                                                                // }(),
                                                            ),
                                                            
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )
                                          ];
                                        },
                                      );
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (context) {
                                      //     return CupertinoActionSheet(
                                      //       actions: List.generate(
                                      //         state.videoList.length,
                                      //         (index) {
                                      //           final String quality = state
                                      //               .videoList[index].quality;
                                      //           return CupertinoActionSheetAction(
                                      //             onPressed: () {},
                                      //             isDestructiveAction: false,
                                      //             child: Text(quality),
                                      //           );
                                      //         },
                                      //       ),
                                      //     );
                                      //   },
                                      // );
                                    },
                                    child: const Icon(
                                      Iconsax.setting_3,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            hideControll(showControll);
                            showControlDuration = 3;
                            autoHideControl();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                          ),
                        );
                      }
                    }
                  }(),
                ),
              ),
            );
          }
        },
      );
    }

    buildVideoPlayer() {
      return BlocBuilder<AnimeVideoBloc, AnimeVideoState>(
        bloc: BlocProvider.of<AnimeVideoBloc>(context),
        builder: (context, state) {
          final bool loading = state.loading;
          if (loading) {
            return const SizedBox();
          } else {
            if (!initialized) {
              final uri = Uri.parse(state.videoList.first.endpoint);
              controller = VideoPlayerController.contentUri(uri)
                ..initialize().then((value) {
                  return bloc
                      .add(const AnimeVideoEvent.playVideo(isPlay: false));
                });
              initialized = true;
              autoHideControl();
              controller.addListener(
                () {
                  int duration = controller.value.duration.inSeconds;
                  int position = controller.value.position.inSeconds;
                  bool buffering = controller.value.isBuffering;
                  bloc.add(AnimeVideoEvent.setPosition(
                    position: position,
                    duration: duration,
                  ));
                  bloc.add(AnimeVideoEvent.setBuffering(buffering: buffering));

                  if (showControlDuration == 0 && state.showControll == false) {
                    hideControll(true);
                  }
                },
              );
            }

            return SizedBox(
              width: width,
              height: height,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: PopScope(
                    canPop: false,
                    onPopInvoked: (_) {
                      if (landscape) {
                        setOrientation();
                      }
                    },
                    child: VideoPlayer(controller),
                  ),
                ),
              ),
            );
          }
        },
      );
    }

    buildLoaded(AnimeVideoState state) {
      List<EpisodeModel> anotherEpisode = state.videoList.first.anotherEpisode;
      final double unUsedHeight = heightMediaQuery(context: context);
      final double usedHeight =
          (unUsedHeight - ((unUsedHeight / 16) * 9) - (unUsedHeight * 0.075));
      late double scrollHeight;
      if (height == null) {
        scrollHeight = unUsedHeight - usedHeight;
      } else {
        scrollHeight = 0;
      }
      return SizedBox(
        height: scrollHeight,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: kCrossAxisAlignmentStart(),
            children: [
              Padding(
                padding: kHorizontalTopPadding,
                child: Text(
                  state.videoList.first.title,
                  style: bodyLarge(context: context),
                ),
              ),
              Padding(
                padding: kAllPadding,
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: state.videoList.first.poster,
                      imageBuilder: (context, imageProvider) {
                        return CircleAvatar(
                          backgroundImage: imageProvider,
                        );
                      },
                    ),
                    Padding(
                      padding: kLeftPadding,
                      child: Text(
                        state.videoList.first.mirror,
                        style: bodyMedium(context: context),
                      ),
                    ),
                    Padding(
                      padding: kLeftPadding,
                      child: Text(
                        state.videoList.last.quality,
                        style: bodySmall(context: context),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: kHorizontalPadding,
                        child: const Row(
                          children: [
                            Icon(Iconsax.notification),
                            Text('Notify Me'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: kAllPadding,
                child: Text(
                  'Watch Another Episode',
                  style: bodyLarge(context: context),
                ),
              ),
              Column(
                children: List.generate(
                  anotherEpisode.length,
                  (index) {
                    return CachedNetworkImage(
                      imageUrl: anotherEpisode[index].poster!,
                      imageBuilder: (context, imageProvider) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                Image(image: imageProvider),
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors:
                                            gradientListColor(context: context),
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: kAllPadding,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: imageProvider,
                                  ),
                                  Padding(
                                    padding: kLeftPadding,
                                    child: Column(
                                      crossAxisAlignment:
                                          kCrossAxisAlignmentStart(),
                                      children: [
                                        Text(
                                          anotherEpisode[index].title.replaceAll(
                                              'Episode ${anotherEpisode[index].episode}',
                                              ''),
                                          style: bodyMedium(context: context),
                                        ),
                                        Text(
                                          '${anotherEpisode[index].date} | Episode ${anotherEpisode[index].episode}',
                                          style: bodySmall(context: context),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }

    buildLoading() {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            Positioned.fill(
              child: Shimmer.fromColors(
                baseColor:
                    onBackgroundColor(context: context).withOpacity(0.05),
                highlightColor:
                    onBackgroundColor(context: context).withOpacity(0.1),
                child: Container(
                  decoration: BoxDecoration(
                    color: onBackgroundColor(context: context),
                  ),
                ),
              ),
            ),
            const LoadingWidget(),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                buildVideoPlayer(),
                Positioned.fill(
                  child: BlocBuilder<AnimeVideoBloc, AnimeVideoState>(
                    builder: (context, state) {
                      final bool buffering = state.buffering;
                      return Stack(
                        children: [
                          () {
                            if (buffering) {
                              return ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                                  child: const Center(
                                    child: LoadingWidget(),
                                  ),
                                ),
                              );
                            }
                            return const SizedBox();
                          }()
                        ],
                      );
                    },
                  ),
                ),
                buildVideoControll(),
              ],
            ),
            BlocBuilder<AnimeVideoBloc, AnimeVideoState>(
              bloc: BlocProvider.of<AnimeVideoBloc>(context),
              builder: (context, state) {
                bool loading = state.loading;
                return Column(
                  children: [
                    loading ? buildLoading() : buildLoaded(state),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
