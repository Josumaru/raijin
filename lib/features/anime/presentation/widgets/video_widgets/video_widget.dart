// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:raijin/core/commons/widgets/anime_video_description_button.dart';
import 'package:raijin/core/commons/widgets/anime_video_icon_button.dart';
import 'package:raijin/core/usecases/more_usecase/more_use_case.dart';
import 'package:raijin/core/usecases/url_launcher_use_case/url_launcher_use_case.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_more_bloc/anime_more_bloc.dart';
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
        AnimeVideoEvent.showControll(
          showControl: !showControll,
        ),
      );
    }

    // Build modal sheet contain quality controll
    buildModalSheet({required AnimeVideoState state}) {
      return WoltModalSheet.show(
        context: context,
        pageListBuilder: (context) {
          final List<VideoModel> videoList = state.videoList;
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
                    childCount: videoList.length,
                    (context, index) {
                      final String endpoint = videoList[index].endpoint;
                      final String quality = videoList[index].quality;
                      return InkWell(
                        onTap: () async {
                          if (state.quality != quality) {
                            bloc.add(
                              AnimeVideoEvent.setControllStatus(
                                quality: quality,
                              ),
                            );
                            Navigator.of(context).pop();
                            final uri = Uri.parse(
                              endpoint,
                            );
                            if (!(state.endpoint == controller.dataSource)) {
                              VideoPlayerController newController =
                                  VideoPlayerController.contentUri(uri);
                              await newController.initialize();

                              await newController.seekTo(
                                Duration(
                                  milliseconds: (controller
                                      .value.position.inMilliseconds),
                                ),
                              );
                              autoHideControl();
                              newController.addListener(
                                () {
                                  int duration =
                                      newController.value.duration.inSeconds;
                                  int position =
                                      newController.value.position.inSeconds;
                                  bool buffering =
                                      newController.value.isBuffering;
                                  bloc.add(AnimeVideoEvent.setPosition(
                                    position: position,
                                    duration: duration,
                                  ));
                                  bloc.add(
                                    AnimeVideoEvent.setBuffering(
                                      buffering: buffering,
                                    ),
                                  );

                                  if (showControlDuration == 0 &&
                                      state.showControll == false) {
                                    hideControll(true);
                                  }
                                },
                              );
                              controller.dispose();
                              controller = newController;
                            }
                          }
                        },
                        borderRadius: kMainBorderRadius,
                        child: Center(
                          child: Padding(
                            padding: kAllPadding,
                            child: Text(
                              quality,
                              style: TextStyle(
                                color: () {
                                  if (state.quality == quality) {
                                    return primaryColor(
                                      context: context,
                                    );
                                  } else {
                                    return onBackgroundColor(
                                      context: context,
                                    );
                                  }
                                }(),
                              ),
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
    }

    // Build modal sheet contain playback controll
    buildPlaybakModalSheet({required AnimeVideoState state}) {
      return WoltModalSheet.show(
        context: context,
        pageListBuilder: (context) {
          final List<double> playbackSpeedList = [
            0.25,
            0.5,
            1,
            1.25,
            1.5,
            2,
          ];
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
                    childCount: playbackSpeedList.length,
                    (context, index) {
                      double playbackSpeed = playbackSpeedList[index];
                      return InkWell(
                        onTap: () async {
                          if (state.playbackSpeed != playbackSpeed) {
                            bloc.add(
                              AnimeVideoEvent.setControllStatus(
                                playbackSpeed: playbackSpeed,
                              ),
                            );
                            Navigator.of(context).pop();
                            controller.setPlaybackSpeed(playbackSpeed);
                          }
                        },
                        borderRadius: kMainBorderRadius,
                        child: Center(
                          child: Padding(
                            padding: kAllPadding,
                            child: Text(
                              '${playbackSpeed}X',
                              style: TextStyle(
                                color: () {
                                  if (state.playbackSpeed == playbackSpeed) {
                                    return primaryColor(
                                      context: context,
                                    );
                                  } else {
                                    return onBackgroundColor(
                                      context: context,
                                    );
                                  }
                                }(),
                              ),
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
          final bool initialize = state.initialize;
          final bool loading = state.loading;
          double sliderPosition = position / duration;

          if (!(sliderPosition <= 1 && sliderPosition >= 0)) {
            sliderPosition = 0;
          }

          void play() {
            bloc.add(AnimeVideoEvent.playVideo(isPlay: playing));
          }

          if (loading) {
            return const SizedBox();
          } else {
            final String poster = state.videoList.first.thumbnail;

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
                                    child: InkWell(
                                      onTap: () {
                                        controller.seekTo(
                                          Duration(seconds: position - 15),
                                        );
                                      },
                                      child: const Icon(
                                        Iconsax.backward_15_seconds,
                                        color: Colors.white,
                                      ),
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
                                    child: InkWell(
                                      onTap: () {
                                        controller.seekTo(
                                          Duration(seconds: position + 15),
                                        );
                                      },
                                      child: const Icon(
                                        Iconsax.forward_15_seconds,
                                        color: Colors.white,
                                      ),
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
                                      padding: landscape
                                          ? kHorizontalPadding
                                          : kBottomPadding,
                                      child: Row(
                                        mainAxisAlignment:
                                            kMainAxisAligmentCenter(),
                                        crossAxisAlignment:
                                            kCrossAxisAlignmentCenter(),
                                        children: [
                                          SizedBox(
                                            width: 50,
                                            child: Center(
                                              child: Text(
                                                '${(position ~/ 60).toString().padLeft(2, '0')}:${(position % 60).toString().padLeft(2, '0')}',
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                SliderTheme(
                                                  data: SliderTheme.of(context)
                                                      .copyWith(
                                                    trackHeight: 3,
                                                    overlayShape:
                                                        const RoundSliderOverlayShape(
                                                      overlayRadius: 0,
                                                    ),
                                                    thumbShape:
                                                        const RoundSliderThumbShape(
                                                      elevation: 0,
                                                      enabledThumbRadius: 5,
                                                      disabledThumbRadius: 3,
                                                    ),
                                                    activeTrackColor:
                                                        primaryColor(
                                                      context: context,
                                                    ),
                                                    inactiveTrackColor: Colors
                                                        .white
                                                        .withOpacity(0.5),
                                                    thumbColor: primaryColor(
                                                      context: context,
                                                    ),
                                                  ),
                                                  child: Slider(
                                                    value: sliderPosition,
                                                    onChanged: (value) {
                                                      bloc.add(
                                                        AnimeVideoEvent
                                                            .setPosition(
                                                          position:
                                                              (value * duration)
                                                                  .round(),
                                                          duration: duration,
                                                        ),
                                                      );
                                                    },
                                                    onChangeEnd: (value) {
                                                      controller.seekTo(
                                                        Duration(
                                                            seconds: (value *
                                                                    duration)
                                                                .round()),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                            child: Center(
                                              child: Text(
                                                () {
                                                  final int hours =
                                                      (((duration - position) ~/
                                                                  60) /
                                                              60)
                                                          .floor();
                                                  final String seconds =
                                                      ((duration - position) %
                                                              60)
                                                          .toString()
                                                          .padLeft(2, '0');
                                                  int minutes =
                                                      ((duration - position) ~/
                                                          60);
                                                  if (minutes > 60) {
                                                    minutes =
                                                        (minutes % 60).floor();
                                                  }
                                                  return '-${hours > 0 ? '${hours.toString()}:' : ''}${minutes.toString().padLeft(2, '0')}:$seconds';
                                                }(),
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            ),
                                          ),
                                          () {
                                            if (!landscape) {
                                              return AnimeVideoIconButton(
                                                icon: Iconsax.maximize_circle,
                                                callback: setOrientation,
                                              );
                                            }
                                            return const SizedBox();
                                          }(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  () {
                                    if (landscape) {
                                      return Stack(
                                        children: [
                                          SizedBox(
                                            height: 65,
                                            width: widthMediaQuery(
                                                context: context),
                                            child: Padding(
                                              padding: kHorizontalPadding,
                                              child: Row(
                                                children: [
                                                  AnimeVideoIconButton(
                                                    text: 'Share',
                                                    icon: Iconsax.send_2,
                                                    callback: () {
                                                      final String encoded =
                                                          Uri.encodeComponent(
                                                              state.endpoint);
                                                      UrlLauncherUseCase().call(
                                                          params:
                                                              'whatsapp://send?text=$encoded');
                                                    },
                                                  ),
                                                  AnimeVideoIconButton(
                                                    text: 'Open',
                                                    icon: Iconsax.maximize_2,
                                                    callback: () {
                                                      UrlLauncherUseCase().call(
                                                        params: state
                                                            .videoList
                                                            .first
                                                            .anime!
                                                            .endpoint,
                                                      );
                                                    },
                                                  ),
                                                  AnimeVideoIconButton(
                                                    text: 'Download',
                                                    icon: Iconsax.direct_down,
                                                    callback: () {
                                                      UrlLauncherUseCase().call(
                                                          params:
                                                              state.endpoint);
                                                    },
                                                  ),
                                                  AnimeVideoIconButton(
                                                    text: '+90 S',
                                                    icon: Iconsax.forward,
                                                    callback: () {
                                                      controller.seekTo(
                                                        Duration(
                                                          seconds:
                                                              position + 88,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  const Spacer(),
                                                  AnimeVideoIconButton(
                                                    text: () {
                                                      if (state.videoList.first
                                                              .nextEpisode ==
                                                          '#') {
                                                        return 'Play Episode ${state.videoList.first.prevEpisode!.replaceAll('/', '').split('').last}';
                                                      } else {
                                                        return 'Play Episode ${state.videoList.first.nextEpisode!.replaceAll('/', '').split('').last}';
                                                      }
                                                    }(),
                                                    icon: () {
                                                      if (state.videoList.first
                                                              .nextEpisode ==
                                                          '#') {
                                                        return Iconsax.previous;
                                                      }
                                                      return Iconsax.previous;
                                                    }(),
                                                    callback: setOrientation,
                                                  ),
                                                  AnimeVideoIconButton(
                                                    icon: Iconsax.maximize_4,
                                                    callback: setOrientation,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // Stack(
                                          //   children: [
                                          //     SizedBox(
                                          //       height: 10,
                                          //       width: widthMediaQuery(
                                          //           context: context),
                                          //       child: SliderTheme(
                                          //         data: SliderTheme.of(context)
                                          //             .copyWith(
                                          //           trackHeight: 20,
                                          //           overlayShape:
                                          //               const RoundSliderOverlayShape(
                                          //             overlayRadius: 0,
                                          //           ),
                                          //           thumbShape:
                                          //               const RoundSliderThumbShape(
                                          //             elevation: 0,
                                          //             enabledThumbRadius: 0,
                                          //             disabledThumbRadius: 0,
                                          //           ),
                                          //           activeTrackColor:
                                          //               Colors.transparent,
                                          //           inactiveTrackColor:
                                          //               Colors.transparent,
                                          //           thumbColor: Colors.transparent,
                                          //         ),
                                          //         child: Slider(
                                          //           value: 0,
                                          //           onChanged: (value) {
                                          //             bloc.add(
                                          //               AnimeVideoEvent.setPosition(
                                          //                 position:
                                          //                     (value * duration)
                                          //                         .round(),
                                          //                 duration: duration,
                                          //               ),
                                          //             );
                                          //           },
                                          //           onChangeEnd: (value) {
                                          //             controller.seekTo(
                                          //               Duration(
                                          //                   seconds:
                                          //                       (value * duration)
                                          //                           .round()),
                                          //             );
                                          //           },
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     Container(
                                          //       height: 3,
                                          //       width: widthMediaQuery(
                                          //           context: context),
                                          //       decoration: const BoxDecoration(
                                          //         color: Colors.white60,
                                          //       ),
                                          //     ),
                                          //     Container(
                                          //       height: 3,
                                          //       width: widthMediaQuery(
                                          //               context: context) *
                                          //           sliderPosition,
                                          //       decoration: BoxDecoration(
                                          //         color: primaryColor(
                                          //             context: context),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                        ],
                                      );
                                    }
                                    return const SizedBox();
                                  }(),
                                ],
                              ),
                            ),
                            Positioned(
                              child: Padding(
                                padding: kHorizontalTopPadding,
                                child: Row(
                                  crossAxisAlignment:
                                      kCrossAxisAlignmentCenter(),
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
                                          style: bodyLarge(context: context)
                                              .copyWith(
                                            color: Colors.white,
                                          ),
                                        );
                                      }
                                      return const SizedBox();
                                    }(),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        buildPlaybakModalSheet(state: state);
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            '${state.playbackSpeed}X',
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Icon(
                                            Iconsax.timer_start,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      onTap: () {
                                        buildModalSheet(state: state);
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            state.quality,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          const Icon(
                                            Iconsax.setting,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            hideControll(showControll);
                            showControlDuration = 3;
                            autoHideControl();
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                child: AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  height: 3,
                                  width: widthMediaQuery(context: context) *
                                      () {
                                        if (sliderPosition >= 0 &&
                                            sliderPosition <= 1) {
                                          return sliderPosition;
                                        }
                                        return 0;
                                      }(),
                                  color: primaryColor(context: context),
                                ),
                              ),
                            ],
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
              final uri = Uri.parse(state.endpoint);
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
                  child: VideoPlayer(controller),
                ),
              ),
            );
          }
        },
      );
    }

    buildLoaded(AnimeVideoState state) {
      List<EpisodeModel> anotherEpisode = state.videoList.first.anotherEpisode;
      final double maxHeight = (heightMediaQuery(context: context) - 56);
      final double videoPlayerHeight =
          (widthMediaQuery(context: context) / 16 * 9);
      final double paddingHeight = paddingMediaQuery(context: context).top;
      double remainingHeight = maxHeight - videoPlayerHeight - paddingHeight;
      if (height != null) {
        remainingHeight = 0;
      }
      return SizedBox(
        height: remainingHeight,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ExpansionTile(
                childrenPadding: kHorizontalPadding,
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        state.videoList.first.title,
                        style: bodyLarge(context: context),
                      ),
                    ),
                    () {
                      if (state.videoList.first.nextEpisode == '#') {
                        return Padding(
                          padding: kLeftPadding,
                          child: Text(
                            'Latest Episode',
                            style: bodySmall(context: context),
                          ),
                        );
                      }
                      return const SizedBox();
                    }(),
                  ],
                ),
                children: [
                  Text(state.videoList.first.synopsis),
                ],
              ),
            ),
            SliverAppBar(
              pinned: true,
              backgroundColor: backgroundColor(context: context),
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              forceElevated: true,
              flexibleSpace: FlexibleSpaceBar(
                background: _buildGenre(state, context),
              ),
              leading: const SizedBox(),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: kCrossAxisAlignmentStart(),
                children: [
                  Row(
                    children: [
                      AnimeVideoDescriptionButton(
                        icon: Iconsax.document_download,
                        text: 'Download',
                        callback: () {
                          UrlLauncherUseCase().call(params: state.endpoint);
                        },
                      ),
                      AnimeVideoDescriptionButton(
                        icon: Iconsax.send_2,
                        text: 'Share',
                        callback: () {
                          final String encoded =
                              Uri.encodeComponent(state.endpoint);
                          UrlLauncherUseCase()
                              .call(params: 'whatsapp://send?text=$encoded');
                        },
                      ),
                      AnimeVideoDescriptionButton(
                        icon: Iconsax.archive_add,
                        text: 'Save',
                        callback: () {},
                      )
                    ],
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
                          imageUrl: anotherEpisode[index].thumbnail!,
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
                                            colors: gradientListColor(
                                                context: context),
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
                                              anotherEpisode[index]
                                                  .title
                                                  .replaceAll(
                                                      'Episode ${anotherEpisode[index].episode}',
                                                      ''),
                                              style:
                                                  bodyMedium(context: context),
                                            ),
                                            Text(
                                              '${anotherEpisode[index].date} | Episode ${anotherEpisode[index].episode}',
                                              style:
                                                  bodySmall(context: context),
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
          ],
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

  SingleChildScrollView _buildGenre(
      AnimeVideoState state, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          state.videoList.first.genre.length,
          (index) {
            return InkWell(
              borderRadius: kMainBorderRadius,
              onTap: () {
                MoreUseCase().call(
                  params: MoreUseCaseParams(
                    context: context,
                    status: '',
                    order: 'latest',
                    type: '',
                    genre: state.videoList.first.genre[index],
                    page: 1,
                  ),
                );
              },
              child: Padding(
                padding: kLeftPadding,
                child: Container(
                  padding: kAllPadding,
                  decoration: BoxDecoration(
                    color: primaryColor(context: context).withOpacity(0.3),
                    borderRadius: kMainBorderRadius,
                  ),
                  child: Text(
                    state.videoList.first.genre[index],
                    style: headlineMedium(context: context),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
