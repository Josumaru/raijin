import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayerWidget extends StatefulWidget {
  CustomVideoPlayerWidget({
    Key? key,
    required this.videoEntity,
  }) : super(key: key);
  final List<VideoEntity> videoEntity;
  late bool isPlaying = false,
      showControl = true,
      isBuffering = true,
      isBackward = false,
      isForward = false;
  late int videoPosition = 0, videoDuration = 0;
  late double sliderPosition = 0;
  @override
  State<CustomVideoPlayerWidget> createState() =>
      _CustomVideoPlayerWidgetState();
}

class _CustomVideoPlayerWidgetState extends State<CustomVideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    try {
      _videoPlayerController = VideoPlayerController.networkUrl(
          Uri.parse(widget.videoEntity[0].endpoint))
        ..initialize()
        ..play().then(
          (value) {
            setState(() {});
          },
        );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error while load the video, try reload the apps'), duration: Duration(seconds: 2),));
    }
    _videoPlayerController.addListener(() {
      setState(() {
        widget.videoDuration = _videoPlayerController.value.duration.inSeconds;
        widget.videoPosition = _videoPlayerController.value.position.inSeconds;
        widget.isPlaying = _videoPlayerController.value.isPlaying;
        widget.isBuffering = _videoPlayerController.value.isBuffering;
        widget.sliderPosition = widget.videoPosition.toDouble() /
            _videoPlayerController.value.duration.inSeconds;
      });

      if (widget.showControl) {
        Future.delayed(const Duration(seconds: 4), () {
          setState(() {
            widget.showControl = false;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController.value.isInitialized
        ? GestureDetector(
            onTap: () {
              setState(() {
                widget.showControl = !widget.showControl;
              });
            },
            child: Container(
              width:
                  (MediaQuery.of(context).orientation == Orientation.landscape)
                      ? MediaQuery.of(context).size.width
                      : null,
              height:
                  (MediaQuery.of(context).orientation == Orientation.landscape)
                      ? MediaQuery.of(context).size.height
                      : null,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    _buildVideoPlayer(),
                    _buildVideoControl(context),
                  ],
                ),
              ),
            ),
          )
        : AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.videoEntity[0].poster,
                  imageBuilder: (context, imageProvider) => Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const CupertinoActivityIndicator(
                      color: kMainAccentColor,
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  _buildVideoControl(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.showControl = !widget.showControl;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: widget.showControl
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
                  ],
                )
              : null,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Row(
              children: [
                GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      widget.isBackward = true;
                    });
                    _videoPlayerController.seekTo(
                      Duration(
                        seconds: (widget.videoPosition - 10),
                      ),
                    );
                    _videoPlayerController.play();
                  },
                  child: Container(
                    height: double.maxFinite,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Icon(
                      widget.isBackward ? Iconsax.backward : Iconsax.previous,
                      size: widget.showControl ? 30 : 0,
                    ),
                  ),
                ),
                Container(
                  height: double.maxFinite,
                  width: MediaQuery.of(context).size.width / 3,
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          widget.isPlaying
                              ? _videoPlayerController.pause()
                              : _videoPlayerController.play();
                        },
                      );
                    },
                    child: widget.isBuffering
                        ? const CupertinoActivityIndicator(
                            color: kMainAccentColor,
                          )
                        : Icon(
                            widget.isPlaying ? Iconsax.pause : Iconsax.play,
                            size: widget.showControl ? 30 : 0,
                          ),
                  ),
                ),
                Container(
                  height: double.maxFinite,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: const BoxDecoration(
                      // color: kMainAccentColor,
                      ),
                  child: Icon(
                    widget.isForward ? Iconsax.forward : Iconsax.next,
                    size: widget.showControl ? 30 : 0,
                  ),
                ),
              ],
            ),
            widget.showControl
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 80
                          : 5,
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${(widget.videoPosition ~/ 60)}:${(widget.videoPosition % 60).toInt().toString().padLeft(2, '0')}',
                        ),
                        Expanded(
                          child: SizedBox(
                            child: CupertinoSlider(
                              activeColor: kMainAccentColor.withOpacity(0.3),
                              thumbColor: kMainAccentColor.withOpacity(0.8),
                              value: widget.sliderPosition,
                              onChanged: (value) {
                                setState(() {
                                  widget.sliderPosition = value;
                                });
                              },
                              onChangeEnd: (value) {
                                _videoPlayerController.seekTo(
                                  Duration(
                                    seconds:
                                        (value * widget.videoDuration).toInt(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: GestureDetector(
                            onTap: () {
                              if (MediaQuery.of(context).orientation ==
                                  Orientation.portrait) {
                                SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.immersiveSticky,
                                  overlays: [SystemUiOverlay.bottom],
                                );
                                SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.landscapeLeft,
                                  DeviceOrientation.landscapeRight
                                ]);
                              } else {
                                SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.portraitDown,
                                  DeviceOrientation.portraitUp
                                ]);
                                SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.edgeToEdge,
                                  overlays: [SystemUiOverlay.bottom],
                                );
                              }
                            },
                            child: const Icon(
                              Iconsax.maximize_21,
                              size: 15,
                            ),
                          ),
                        ),
                        Text(
                          '${widget.videoDuration ~/ 60}:${widget.videoDuration % 60}',
                        ),
                      ],
                    ),
                  )
                : Positioned(
                    left: 0,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: MediaQuery.of(context).size.width *
                          widget.sliderPosition,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  _buildVideoPlayer() {
    return Center(
      child: AspectRatio(
          aspectRatio: 16 / 9, child: VideoPlayer(_videoPlayerController)),
    );
  }
}
