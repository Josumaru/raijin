import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/core/usecases/toast_usecase/toas_use_case.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:raijin/features/anime/presentation/widgets/video_widgets/video_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    super.key,
    required List<VideoModel> videoModel,
  }) : _videoModel = videoModel;

  final List<VideoModel> _videoModel;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late List<VideoModel> videoModel = widget._videoModel;
  late bool isPlaying = false;
  late bool showControl = true;
  late bool isBuffering = true;
  late bool isBackward = false;
  late bool isForward = false;
  late int videoPosition = 0;
  late int videoDuration = 0;
  late int showControlDuration = 3;
  late double sliderPosition = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    try {
      _controller = VideoPlayerController.contentUri(
        Uri.parse(videoModel[0].endpoint),
      )
        ..initialize()
        ..play().then((value) => setState(() {}));
      hideControl();
      _controller.addListener(() async {
        videoDuration = _controller.value.duration.inSeconds;
        videoPosition = _controller.value.position.inSeconds;
        isPlaying = _controller.value.isPlaying;
        isBuffering = _controller.value.isBuffering;
        sliderPosition =
            videoPosition.toDouble() / _controller.value.duration.inSeconds;
        if (showControlDuration == 0) {
          showControl = false;
        }
        setState(() {});
      });
    } catch (e) {
      ToastUseCase toastUseCase = ToastUseCase(fToast: sl());
      toastUseCase(params: e.toString());
    }
  }

  void hideControl() {
    const seconds = Duration(seconds: 1);
    timer = Timer.periodic(seconds, (Timer timer) {
      if (showControlDuration > 0) {
        showControlDuration -= 1;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller.pause();
    // _setOrientation();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: () {
              showControl = !showControl;
            },
            child: SizedBox(
              width:
                  (MediaQuery.of(context).orientation == Orientation.landscape)
                      ? widthMediaQuery(context: context)
                      : null,
              height:
                  (MediaQuery.of(context).orientation == Orientation.landscape)
                      ? heightMediaQuery(context: context)
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
                  imageUrl: videoModel[0].poster.toString(),
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
                    child: const LoadingWidget(),
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
          showControl = !showControl;
          showControlDuration = 3;
          hideControl();
          setState(() {});
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: showControl ? darkColor() : null,
          gradient: showControl
              ? LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: gradientListColor(context: context),
                )
              : null,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 5,
              left: 5,
              child: Row(
                children: [
                  Icon(
                    Iconsax.arrow_left_2,
                    color: Colors.white,
                    size: showControl ? 24 : 0,
                  ),
                  Text(
                    videoModel.first.title,
                    style: bodyLarge(context: context).copyWith(
                      color: Colors.white,
                      fontSize: showControl ? 14 : 0,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: InkWell(
                borderRadius: kMainBorderRadius,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Column(
                      children: [
                        const Spacer(),
                        CupertinoActionSheet(
                          title: const Text('Video Quality'),
                          message: const Text('Select available option'),
                          actions: List.generate(
                            videoModel.length,
                            (index) => CupertinoActionSheetAction(
                              onPressed: () {
                                _controller = VideoPlayerController.contentUri(
                                  Uri.parse(videoModel[index].endpoint),
                                )
                                  ..initialize()
                                  ..seekTo(Duration(seconds: videoPosition))
                                  ..play().then((value) => setState(() {}));
                              },
                              child: Text(videoModel[index].quality),
                            ),
                          ),
                  
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            // isDestructiveAction: true,
                            child: const Text('Cancel'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Icon(
                  Iconsax.setting_2,
                  color: Colors.white,
                  size: showControl ? 24 : 0,
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      isBackward = true;
                    });
                    _controller.seekTo(
                      Duration(
                        seconds: (videoPosition - 10),
                      ),
                    );
                    _controller.play();
                  },
                  child: SizedBox(
                    height: double.maxFinite,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Icon(
                      isBackward ? Iconsax.backward : Iconsax.previous,
                      size: showControl ? 30 : 0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: double.maxFinite,
                  width: MediaQuery.of(context).size.width / 3,
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          isPlaying ? _controller.pause() : _controller.play();
                        },
                      );
                    },
                    child: isBuffering
                        ? Center(
                            child: LoadingAnimationWidget.stretchedDots(
                              color: backgroundColor(context: context),
                              size: 40,
                            ),
                          )
                        : Icon(
                            isPlaying ? Iconsax.pause : Iconsax.play,
                            size: showControl ? 30 : 0,
                            color: Colors.white,
                          ),
                  ),
                ),
                SizedBox(
                  height: double.maxFinite,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Icon(
                    isForward ? Iconsax.forward : Iconsax.next,
                    size: showControl ? 30 : 0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            showControl ? _sliderControl(context) : _sliderIndicator(context),
          ],
        ),
      ),
    );
  }

  Positioned _sliderIndicator(BuildContext context) {
    return Positioned(
      left: 0,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: widthMediaQuery(context: context) * sliderPosition,
        height: 2,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      ),
    );
  }

  Padding _sliderControl(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).orientation == Orientation.landscape
            ? 80
            : 5,
      ),
      child: Row(
        children: [
          Text(
            '${(videoPosition ~/ 60).toString().padLeft(2, '0')}:${(videoPosition % 60).toInt().toString().padLeft(2, '0')}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Expanded(
            child: SizedBox(
              child: CupertinoSlider(
                activeColor: kMainAccentColor.withOpacity(0.3),
                thumbColor: kMainAccentColor.withOpacity(0.8),
                value: sliderPosition,
                onChanged: (value) {
                  setState(() {
                    sliderPosition = value;
                  });
                },
                onChangeEnd: (value) {
                  _controller.seekTo(
                    Duration(
                      seconds: (value * videoDuration).toInt(),
                    ),
                  );
                },
              ),
            ),
          ),
          Text(
            '${videoDuration ~/ 60}:${(videoDuration % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              _setOrientation();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(
                Iconsax.maximize_21,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildVideoPlayer() {
    return Center(
      child: AspectRatio(aspectRatio: 16 / 9, child: VideoPlayer(_controller)),
    );
  }

  void _setOrientation() {
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
}
