// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
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
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class VideoWidget extends StatelessWidget {
  VideoWidget({super.key});

  bool initialized = false;
  late VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    final AnimeVideoBloc bloc = context.read<AnimeVideoBloc>();
    final double devicesWidth = widthMediaQuery(context: context);
    final double? width =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? widthMediaQuery(context: context)
            : null;
    final double? height =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? heightMediaQuery(context: context)
            : null;

    // hide video controll
    void hideControll(bool showControll) {
      bloc.add(
        AnimeVideoEvent.showControl(
          showControl: !showControll,
        ),
      );
    }

    // Change to !orientation
    void setOrientation() {
      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.immersiveSticky,
          overlays: [SystemUiOverlay.bottom],
        );
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.edgeToEdge,
          overlays: [SystemUiOverlay.bottom],
        );
      }
    }

    // Build the controll
    buildVideoControll() {
      return BlocBuilder<AnimeVideoBloc, AnimeVideoState>(
        builder: (context, state) {
          final bool buffering = state.buffering;
          final bool playing = state.playing;
          final bool initialize = state.initialize;
          final bool showControll = state.showControll;
          final int position = state.videoPosition;
          final int duration = state.videoDuration;
          final double sliderPosition = position / duration;

          play() {
            bloc.add(AnimeVideoEvent.playVideo(isPlay: playing));
          }

          if (!initialize && !state.loading) {
            if (playing) {
              controller.play();
              Wakelock.enable();
            } else {
              controller.pause();
              Wakelock.disable();
            }
          }

          if (state.loading) {
            return const SizedBox();
          } else {
            final String poster = state.videoList.first.poster;
            return GestureDetector(
              onTap: () {
                hideControll(showControll);
              },
              child: Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: initialize
                      ? Stack(
                          children: [
                            Center(
                              child: CachedNetworkImage(imageUrl: poster),
                            ),
                            const Positioned.fill(child: LoadingWidget())
                          ],
                        )
                      : showControll
                          ? Stack(
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
                                    crossAxisAlignment:
                                        kCrossAxisAlignmentCenter(),
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
                                        child: buffering
                                            ? const LoadingWidget()
                                            : InkWell(
                                                onTap: play,
                                                child: playing
                                                    ? const Icon(
                                                        Iconsax.pause,
                                                        color: Colors.white,
                                                      )
                                                    : const Icon(
                                                        Iconsax.play,
                                                        color: Colors.white,
                                                      ),
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
                                    crossAxisAlignment:
                                        kCrossAxisAlignmentStart(),
                                    children: [
                                      AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        width:
                                            widthMediaQuery(context: context),
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
                                            width: widthMediaQuery(
                                                context: context),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 35,
                                            width: widthMediaQuery(
                                                context: context),
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
                                                    thumbColor:
                                                        Colors.transparent,
                                                  ),
                                                  child: Slider(
                                                    value: 0,
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
                                                      bloc.add(AnimeVideoEvent
                                                          .seekPosition(
                                                              position: value));
                                                      controller.seekTo(
                                                          Duration(
                                                              seconds: (value *
                                                                      duration)
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
                              ],
                            )
                          : GestureDetector(
                              onTap: () {
                                hideControll(showControll);
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
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
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: kCrossAxisAlignmentStart(),
          children: [
            Padding(
              padding: kLeftPadding,
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
    ));
  }
}

// class VideoWidget extends StatefulWidget {
//   const VideoWidget({super.key});

//     late VideoPlayerController _controller;
//   @override
//   State<VideoWidget> createState() => _VideoWidgetState();
// }

// class _VideoWidgetState extends State<VideoWidget> {
//   @override
//   Widget build(BuildContext context) {

//   }

//   _buildLoaded(AnimeVideoState state) {
//     List<EpisodeModel> anotherEpisode = state.videoList.first.anotherEpisode;
//     return Column(
//       crossAxisAlignment: kCrossAxisAlignmentStart(),
//       children: [
//         Padding(
//           padding: kLeftPadding,
//           child: Text(
//             state.videoList.first.title,
//             style: bodyLarge(context: context),
//           ),
//         ),
//         Padding(
//           padding: kAllPadding,
//           child: Row(
//             children: [
//               CachedNetworkImage(
//                 imageUrl: state.videoList.first.poster,
//                 imageBuilder: (context, imageProvider) {
//                   return CircleAvatar(
//                     backgroundImage: imageProvider,
//                   );
//                 },
//               ),
//               Padding(
//                 padding: kLeftPadding,
//                 child: Text(
//                   state.videoList.first.mirror,
//                   style: bodyMedium(context: context),
//                 ),
//               ),
//               Padding(
//                 padding: kLeftPadding,
//                 child: Text(
//                   state.videoList.last.quality,
//                   style: bodySmall(context: context),
//                 ),
//               ),
//               const Spacer(),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 0),
//                 ),
//                 onPressed: () {},
//                 child: Padding(
//                   padding: kHorizontalPadding,
//                   child: const Row(
//                     children: [
//                       Icon(Iconsax.notification),
//                       Text('Notify Me'),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//         Padding(
//           padding: kAllPadding,
//           child: Text(
//             'Watch Another Episode',
//             style: bodyLarge(context: context),
//           ),
//         ),
//         Column(
//           children: List.generate(
//             anotherEpisode.length,
//             (index) {
//               return CachedNetworkImage(
//                 imageUrl: anotherEpisode[index].poster!,
//                 imageBuilder: (context, imageProvider) {
//                   return Column(
//                     children: [
//                       Stack(
//                         children: [
//                           Image(image: imageProvider),
//                           Positioned.fill(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   colors: gradientListColor(context: context),
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: kAllPadding,
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundImage: imageProvider,
//                             ),
//                             Padding(
//                               padding: kLeftPadding,
//                               child: Column(
//                                 crossAxisAlignment: kCrossAxisAlignmentStart(),
//                                 children: [
//                                   Text(
//                                     anotherEpisode[index].title.replaceAll(
//                                         'Episode ${anotherEpisode[index].episode}',
//                                         ''),
//                                     style: bodyMedium(context: context),
//                                   ),
//                                   Text(
//                                     '${anotherEpisode[index].date} | Episode ${anotherEpisode[index].episode}',
//                                     style: bodySmall(context: context),
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   );
//                 },
//               );
//               // return Padding(
//               //   padding: kHorizontalTopPadding,
//               //   child: InkWell(
//               //     onTap: () {},
//               //     borderRadius: kMainBorderRadius,
//               //     child: CachedNetworkImage(
//               //       imageUrl: anotherEpisode[index].poster!,
//               //       imageBuilder: (context, imageProvider) {
//               //         return Row(
//               //           children: [
//               //             Stack(
//               //               children: [
//               //                 Container(
//               //                   width: widthMediaQuery(context: context) * 0.3,
//               //                   height:
//               //                       heightMediaQuery(context: context) * 0.1,
//               //                   decoration: BoxDecoration(
//               //                     borderRadius: kMainBorderRadius,
//               //                     image: DecorationImage(
//               //                       image: imageProvider,
//               //                       fit: BoxFit.cover,
//               //                     ),
//               //                   ),
//               //                 ),
//               //                 Positioned.fill(
//               //                   child: Container(
//               //                     decoration: BoxDecoration(
//               //                       borderRadius: kMainBorderRadius,
//               //                       gradient: LinearGradient(
//               //                         colors:
//               //                             gradientListColor(context: context),
//               //                         begin: Alignment.topCenter,
//               //                         end: Alignment.bottomCenter,
//               //                       ),
//               //                     ),
//               //                   ),
//               //                 ),
//               //                 Positioned(
//               //                   bottom: 5,
//               //                   left: 5,
//               //                   child: Text(
//               //                     '${anotherEpisode[index].episode}',
//               //                     style:
//               //                         headlineLarge(context: context).copyWith(
//               //                       fontSize: 45,
//               //                     ),
//               //                   ),
//               //                 ),
//               //               ],
//               //             ),
//               //             Expanded(
//               //               child: Padding(
//               //                 padding: kLeftPadding,
//               //                 child: SizedBox(
//               //                   height:
//               //                       heightMediaQuery(context: context) * 0.1,
//               //                   child: Column(
//               //                     crossAxisAlignment:
//               //                         kCrossAxisAlignmentStart(),
//               //                     mainAxisAlignment: kMainAxisAligmentStart(),
//               //                     children: [
//               //                       Text(
//               //                         anotherEpisode[index].title,
//               //                         style: headlineMedium(context: context),
//               //                         maxLines: 2,
//               //                         overflow: TextOverflow.ellipsis,
//               //                       ),
//               //                       Text(
//               //                         anotherEpisode[index].date,
//               //                         style: bodySmall(context: context),
//               //                       ),
//               //                     ],
//               //                   ),
//               //                 ),
//               //               ),
//               //             )
//               //           ],
//               //         );
//               //       },
//               //     ),
//               //   ),
//               // );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   _buildLoading() {
//     return AspectRatio(
//       aspectRatio: 16 / 9,
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: Shimmer.fromColors(
//               baseColor: onBackgroundColor(context: context).withOpacity(0.05),
//               highlightColor:
//                   onBackgroundColor(context: context).withOpacity(0.1),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: onBackgroundColor(context: context),
//                 ),
//               ),
//             ),
//           ),
//           const LoadingWidget(),
//         ],
//       ),
//     );
//   }
// }

// class LoadingWidget extends StatelessWidget {
//   const LoadingWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: kMainAxisAligmentStart(),
//       crossAxisAlignment: kCrossAxisAlignmentStart(),
//       children: [
//         AspectRatio(
//           aspectRatio: 16 / 9,
//           child: Container(
//             decoration: BoxDecoration(
//               color: onBackgroundColor(context: context).withOpacity(0),
//             ),
//             child: Center(
//               child: LoadingAnimationWidget.stretchedDots(
//                 color: backgroundColor(context: context),
//                 size: 40,
//               ),
//             ),
//           ),
//         ),
//         // const SizedBox(height: 10),
//         // Padding(
//         //   padding: kMainPadding,
//         //   child: Shimmer.fromColors(
//         //     baseColor: onBackgroundColor(context: context).withOpacity(0.1),
//         //     highlightColor:
//         //         onBackgroundColor(context: context).withOpacity(0.3),
//         //     child: Container(
//         //       width: 140,
//         //       height: 18,
//         //       decoration: BoxDecoration(
//         //         borderRadius: kMainBorderRadius / 2,
//         //         color: backgroundColor(context: context),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         Expanded(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               children: List.generate(
//                 5,
//                 (index) => Padding(
//                   padding: kMainPadding,
//                   child: const AnimeEpisodeCardShimmer(),
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
