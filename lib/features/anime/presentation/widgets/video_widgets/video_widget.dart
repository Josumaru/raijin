import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raijin/core/commons/widgets/anime_video_description_button.dart';
import 'package:raijin/core/commons/widgets/anime_video_icon_button.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/anime/data/models/user_preferences_model/user_preferences_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_download_use_case.dart';
import 'package:raijin/core/usecases/more_usecase/more_use_case.dart';
import 'package:raijin/core/usecases/url_launcher_use_case/url_launcher_use_case.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_bookmark_bloc/anime_bookmark_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_donwload_bloc/anime_download_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_history_bloc/anime_history_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_preferences/anime_preferences_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';
import 'package:iconsax/iconsax.dart';
import 'package:webview_flutter/webview_flutter.dart';
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

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late AnimeVideoBloc _bloc;
  late VideoPlayerController _controller;
  late WebViewController webController;
  late Timer _timer;
  late Timer _historyTimer;
  late double _devicesWidth;
  late double? _width;
  late double? _height;
  late double _sliderPosition;
  late double _playbackSpeed;
  late bool _firstInstance;
  late bool _initialized;
  late bool _loading;
  late bool _landscape;
  late bool _buffering;
  late bool _playing;
  late bool _showControll;
  late bool _complete;
  late bool _shifting;
  late int _showControlDuration;
  late int _addHistoryDuration;
  late int _duration;
  late int _position;
  late String _quality;
  late String _server;
  late String _title;
  late String _videoEndpoint;
  late String _thumbnail;
  late String _navigation;
  late Orientation _orientation;
  late bool _error;

  @override
  void initState() {
    _orientation = Orientation.portrait;
    _duration = 0;
    _position = 0;
    _showControlDuration = 3;
    _addHistoryDuration = 10;
    _playbackSpeed = 1.0;
    _sliderPosition = _duration / _position;
    _loading = true;
    _playing = true;
    _showControll = false;
    _initialized = false;
    _buffering = false;
    _complete = false;
    _shifting = false;
    _error = true;
    _firstInstance = true;
    _quality = '720p';
    _title = 'Raijin Anime';
    _server = '';
    _thumbnail = '';
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
    );
    if (_initialized) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _devicesWidth = widthMediaQuery(context: context);
    _orientation = MediaQuery.of(context).orientation;
    _landscape = _orientation == Orientation.landscape;
    _bloc = context.read<AnimeVideoBloc>();
    context
        .read<AnimeBookmarkBloc>()
        .add(const AnimeBookmarkEvent.getAnimeList());

    // change width and height when orientation is changed, trigered when rebuild widget
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      _width = widthMediaQuery(context: context);
      _height = heightMediaQuery(context: context);
    } else {
      _width = null;
      _height = null;
    }

    return PopScope(
      canPop: _orientation == Orientation.portrait,
      onPopInvoked: (didPop) {
        if (!didPop) {
          _setOrientation();
        }
      },
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Stack(
                children: [
                  _buildVideoPlayer(),
                  Positioned.fill(
                    child: () {
                      if (_buffering) {
                        return ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: const Center(
                              child: LoadingWidget(),
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    }(),
                  ),
                  _buildVideoControll(),
                  () {
                    if (_server.toLowerCase() == 'webview' &&
                        _orientation == Orientation.portrait &&
                        !_loading) {
                      return SizedBox(
                        height: (widthMediaQuery(context: context) / 16) * 9,
                        child: InkWell(
                          onTap: () {
                            _setOrientation();
                          },
                          child: Center(
                            child: Icon(
                              Iconsax.play,
                              color: onBackgroundColor(context: context),
                              size: 24,
                            ),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  }()
                ],
              ),
              BlocBuilder<AnimeVideoBloc, AnimeVideoState>(
                bloc: BlocProvider.of<AnimeVideoBloc>(context),
                builder: (context, state) {
                  return Column(
                    children: [
                      () {
                        if (state.error) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _changeServer(context: context);
                          });
                        }
                        if (_loading && !_shifting) {
                          return _buildLoading();
                        } else {
                          return _buildLoaded(state);
                        }
                      }()
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeServer({required BuildContext context}) async {
    return WoltModalSheet.show(
      context: context,
      pageListBuilder: (context) {
        final List<String> serverList = [
          'pixeldrain',
          'kraken',
          'Webview',
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
                  childCount: serverList.length,
                  (context, index) {
                    String server = serverList[index];
                    return InkWell(
                      onTap: () async {
                        if (server != _server) {
                          Navigator.of(context).pop();
                          _server = server;
                          final videoEndpoint =
                              context.read<AnimeVideoBloc>().state;
                          context
                              .read<AnimeVideoBloc>()
                              .add(AnimeVideoEvent.getVideo(
                                endpoint: videoEndpoint.endpoint,
                                baseUrl: videoEndpoint.baseUrl,
                                position: 0,
                                server: server,
                              ));
                          setState(() {});
                        }
                      },
                      borderRadius: kMainBorderRadius,
                      child: Center(
                        child: Padding(
                          padding: kAllPadding,
                          child: Text(
                            server.replaceFirst(
                                server[0], server[0].toUpperCase()),
                            style: TextStyle(
                              color: () {
                                if (_server == server) {
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

  // Set showControllDuration -1 every seconds
  void _autoHideControl() {
    const seconds = Duration(seconds: 1);
    _timer = Timer.periodic(seconds, (Timer timer) {
      if (_showControlDuration > 0) {
        _showControlDuration -= 1;
      } else {
        timer.cancel();
      }
    });
  }

  // hide video controll
  void _hideControll(bool showControll) {
    setState(() {
      _showControll = showControll;
    });
  }

  // Add History to firestore
  void _addAnimeHistory({required AnimeVideoState state}) {
    const seconds = Duration(seconds: 1);
    _addHistoryDuration = 10;
    _historyTimer = Timer.periodic(seconds, (timer) {
      if (_addHistoryDuration == 0) {
        if (!_shifting && !_buffering && _playing) {
          context.read<AnimeHistoryBloc>().add(
                AnimeHistoryEvent.addAnimeHistory(
                  video: VideoModel(
                    quality: _quality,
                    mirror: state.videoList.first.mirror,
                    endpoint: state.videoList.first.endpoint
                        .split(kAnimeEndpoint)
                        .last
                        .replaceAll('/', ''),
                    baseUrl: state.videoList.first.baseUrl
                        .split(kAnimeEndpoint)
                        .last
                        .replaceAll('/', ''),
                    poster: state.videoList.first.poster
                        .split(kAnimeEndpoint)
                        .last
                        .trim(),
                    title: _title,
                    synopsis: state.videoList.first.synopsis,
                    thumbnail: state.videoList.first.thumbnail,
                    genre: state.videoList.first.genre,
                    anotherEpisode: state.videoList.first.anotherEpisode,
                    duration: _duration,
                    position: _position,
                    videoEndpoint: _videoEndpoint,
                    timestamp: FieldValue.serverTimestamp(),
                  ),
                ),
              );
        }
        context
            .read<AnimeHistoryBloc>()
            .add(const AnimeHistoryEvent.getAnimeHistory());
        _addHistoryDuration = 10;
      } else if (_addHistoryDuration > 0) {
        _addHistoryDuration--;
      } else {
        _historyTimer.cancel();
      }
    });
  }

  // Build the controll
  _buildVideoControll() {
    return BlocBuilder<AnimeVideoBloc, AnimeVideoState>(
      builder: (context, state) {
        if (!(_sliderPosition <= 1 && _sliderPosition >= 0)) {
          _sliderPosition = 0;
        }

        if (_loading) {
          return const SizedBox();
        } else {
          if (_thumbnail == '') {
            _thumbnail = state.videoList.first.thumbnail;
          }

          void play() {
            // when initialize and loading state become false, then play video based on playing state
            if (_initialized) {
              if (!_playing) {
                _controller.play();
                _addAnimeHistory(state: state);
                Wakelock.enable();
              } else {
                _controller.pause();
                _historyTimer.cancel();
                Wakelock.disable();
              }
              setState(() {
                _playing = !_playing;
              });
            }
          }

          return GestureDetector(
            onTap: () {
              _hideControll(!_showControll);
              _showControlDuration = 3;
              _autoHideControl();
            },
            child: Container(
              width: _width,
              height: _height,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: () {
                  if (_server.toLowerCase() == 'webview') {
                    void injectJavaScript(controller) {
                      controller.runJavaScript('''
                        document.querySelectorAll('img').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('header').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('ol').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('disqus_thread').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('commentarea').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('.commentarea').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('.pencenter').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('.widget').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('noscript').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('meta').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('.logo-container').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('.video-nav').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('footer').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('#footer').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('.copyright_eastheme').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('aside').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('a').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('.nav-eps').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('.whites').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('.naveps').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('br').forEach((el)=>{
                            el.remove()
                        });

                        document.querySelectorAll('.player-area').id = '';

                        const widget = document.querySelectorAll('.widget_senction');
                        widget.forEach((element)=>{element.classList.remove('widget_senction')})
                        document.querySelectorAll('.has-post-thumbnail').forEach((element)=>{
                          element.classList.remove('has-post-thumbnail')
                        })

                        document.querySelectorAll('#breadcrumbs').forEach((el)=>{
                            el.remove()
                        });

                        document.getElementById('container').id = ''
                        document.getElementById('infoarea').id = ''

                      ''');
                    }

                    webController = WebViewController()
                      ..setJavaScriptMode(JavaScriptMode.unrestricted)
                      ..setBackgroundColor(backgroundColor(context: context))
                      ..setNavigationDelegate(
                        NavigationDelegate(
                          onNavigationRequest: (NavigationRequest request) {
                            return NavigationDecision.prevent;
                          },
                          onProgress: (progress) {
                            if (progress == 100) {
                              injectJavaScript(webController);
                            }
                          },
                        ),
                      )
                      ..loadRequest(Uri.parse(state.endpoint));

                    // injectJavaScript();

                    return SizedBox(
                      width: _width,
                      height: _height,
                      child: WebViewWidget(controller: webController),
                    );
                  } else if (!_initialized && !_loading || _shifting) {
                    return Stack(
                      children: [
                        Center(
                          child: CachedNetworkImage(
                            imageUrl: _thumbnail,
                            errorWidget: (context, url, error) => Text(
                              'Unable to Load Image',
                              style: bodySmall(context: context),
                            ),
                          ),
                        ),
                        const Positioned.fill(child: LoadingWidget()),
                        Positioned.fill(
                          child: () {
                            if (_shifting) {
                              return ClipRRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 20,
                                    sigmaY: 20,
                                  ),
                                  child: const Center(
                                    child: LoadingWidget(),
                                  ),
                                ),
                              );
                            }
                            return const SizedBox();
                          }(),
                        ),
                      ],
                    );
                  } else {
                    if (_showControll) {
                      return SizedBox(
                        width: widthMediaQuery(context: context),
                        child: Stack(
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
                                mainAxisAlignment:
                                    kMainAxisAligmentSpaceEvenly(),
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: InkWell(
                                      borderRadius: kMainBorderRadius,
                                      onTap: () {
                                        _controller.seekTo(
                                          Duration(seconds: _position - 15),
                                        );
                                      },
                                      child: const Icon(
                                        Iconsax.backward_15_seconds,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: InkWell(
                                      onTap: play,
                                      child: () {
                                        // Show when the video is not buffering
                                        if (_playing && !_buffering) {
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
                                      }(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: InkWell(
                                      onTap: () {
                                        _controller.seekTo(
                                          Duration(seconds: _position + 15),
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
                            _buildBottomControll(
                              context,
                              _landscape,
                              _position,
                              _sliderPosition,
                              _bloc,
                              _duration,
                              _setOrientation,
                              state,
                            ),
                            Positioned(
                              right: 0,
                              left: 0,
                              child: Padding(
                                padding: kHorizontalTopPadding,
                                child: Row(
                                  crossAxisAlignment:
                                      kCrossAxisAlignmentCenter(),
                                  children: [
                                    InkWell(
                                      borderRadius: kMainBorderRadius,
                                      onTap: () {
                                        if (_landscape) {
                                          _setOrientation();
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
                                      if (_landscape) {
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
                                        _buildPlaybakModalSheet(state: state);
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            '${_playbackSpeed}X',
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
                                        _buildModalSheet(state: state);
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            _quality,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Padding(
                                            padding: kRightPadding,
                                            child: const Icon(
                                              Iconsax.setting,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ).animate(delay: .1.seconds).slideY(),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          _hideControll(!_showControll);
                          _showControlDuration = 3;
                          _autoHideControl();
                        },
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

  // Change to !orientation
  void _setOrientation() {
    if (_orientation == Orientation.portrait) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersive,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
      );
      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft],
      );
    } else {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
      );
    }
  }

  Positioned _buildBottomControll(
    BuildContext context,
    bool landscape,
    int position,
    double sliderPosition,
    AnimeVideoBloc bloc,
    int duration,
    void Function() setOrientation,
    AnimeVideoState state,
  ) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Column(
        crossAxisAlignment: kCrossAxisAlignmentStart(),
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: widthMediaQuery(context: context),
            child: Padding(
              padding: landscape ? kHorizontalPadding : kBottomPadding,
              child: Row(
                mainAxisAlignment: kMainAxisAligmentCenter(),
                crossAxisAlignment: kCrossAxisAlignmentCenter(),
                children: [
                  SizedBox(
                    width: 50,
                    child: Center(
                      child: Text(
                        '${(position ~/ 60).toString().padLeft(2, '0')}:${(position % 60).toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 3,
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 0,
                        ),
                        thumbShape: const RoundSliderThumbShape(
                          elevation: 0,
                          enabledThumbRadius: 5,
                          disabledThumbRadius: 3,
                        ),
                        activeTrackColor: primaryColor(
                          context: context,
                        ),
                        inactiveTrackColor: Colors.white.withOpacity(0.5),
                        thumbColor: primaryColor(
                          context: context,
                        ),
                      ),
                      child: Slider(
                        value: _sliderPosition,
                        onChanged: (value) {
                          if (value % 0.02 > 0.015) {
                            setState(() {
                              _sliderPosition = value;
                            });
                          }
                        },
                        onChangeEnd: (value) {
                          _controller.seekTo(
                            Duration(seconds: (value * _duration).round()),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Center(
                      child: Text(
                        () {
                          final int hours =
                              (((duration - position) ~/ 60) / 60).floor();
                          final String seconds = ((duration - position) % 60)
                              .toString()
                              .padLeft(2, '0');
                          int minutes = ((duration - position) ~/ 60);
                          if (minutes > 60) {
                            minutes = (minutes % 60).floor();
                          }
                          return '-${hours > 0 ? '${hours.toString()}:' : ''}${minutes.toString().padLeft(2, '0')}:$seconds';
                        }(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
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
              return SizedBox(
                height: 65,
                width: widthMediaQuery(context: context),
                child: Padding(
                  padding: kHorizontalPadding,
                  child: Row(
                    children: [
                      AnimeVideoIconButton(
                        text: 'Share',
                        icon: Iconsax.send_2,
                        callback: () {
                          _shareWhatsApp(state: state);
                        },
                      ),
                      AnimeVideoIconButton(
                        text: 'Open',
                        icon: Iconsax.maximize_2,
                        callback: () {
                          UrlLauncherUseCase().call(
                            params:
                                '$kAnimeEndpoint${state.videoList.first.baseUrl}',
                          );
                        },
                      ),
                      AnimeVideoIconButton(
                        text: 'Download',
                        icon: Iconsax.directbox_receive,
                        callback: () {
                          _downloadVideo(
                            title: state.videoList.first.title,
                            quality: _quality,
                            endpoint: _videoEndpoint,
                          );
                        },
                      ),
                      AnimeVideoIconButton(
                        text: '+90 S',
                        icon: Iconsax.forward,
                        callback: () {
                          _controller.seekTo(
                            Duration(
                              seconds: position + 88,
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      AnimeVideoIconButton(
                        text: () {
                          _navigation = state.videoList.first.nextEpisode!;
                          if (_navigation == '#') {
                            _navigation = state.videoList.first.prevEpisode!;
                            return 'Play Episode ${state.videoList.first.prevEpisode!.replaceAll('/', '').split('').last}';
                          } else {
                            _navigation = state.videoList.first.nextEpisode!;
                            return 'Play Episode ${state.videoList.first.nextEpisode!.replaceAll('/', '').split('').last}';
                          }
                        }(),
                        icon: () {
                          if (state.videoList.first.nextEpisode == '#') {
                            return Iconsax.previous;
                          }
                          return Iconsax.previous;
                        }(),
                        callback: () {
                          _changeEpisode(
                            endpoint: _navigation,
                            title: _title,
                            thumbnail: _thumbnail,
                            baseUrl: state.videoList.first.baseUrl,
                          );
                        },
                      ),
                      AnimeVideoIconButton(
                        icon: Iconsax.maximize_4,
                        callback: setOrientation,
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          }(),
        ],
      ).animate(delay: .1.milliseconds).slideY(
            begin: 1,
          ),
    );
  }

  // Build modal sheet contain quality controll
  _buildModalSheet({required AnimeVideoState state}) {
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
                    final String videoEndpoint = videoList[index].videoEndpoint;
                    final String quality = videoList[index].quality;
                    return InkWell(
                      onTap: () async {
                        if (_quality != quality) {
                          _quality = quality;
                          Navigator.of(context).pop();
                          final uri = Uri.parse(videoEndpoint);
                          if (!(videoEndpoint == _controller.dataSource)) {
                            _videoEndpoint = videoEndpoint;
                            VideoPlayerController newController =
                                VideoPlayerController.contentUri(uri);
                            await newController.initialize().then((value) {
                              newController.seekTo(Duration(
                                  milliseconds: _controller
                                      .value.position.inMilliseconds));
                            });
                            _autoHideControl();
                            _controller.dispose();
                            _controller = newController;
                            _controller.addListener(() {
                              _duration =
                                  newController.value.duration.inSeconds;
                              _position =
                                  newController.value.position.inSeconds;
                              _buffering = newController.value.isBuffering;
                              if (_showControlDuration == 0 &&
                                  _showControll == true) {
                                _hideControll(false);
                              }
                              setState(() {});
                            });
                            _controller.play();
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
                                if (_quality == quality) {
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
  _buildPlaybakModalSheet({required AnimeVideoState state}) {
    return WoltModalSheet.show(
      context: context,
      pageListBuilder: (context) {
        final List<double> playbackSpeedList = [
          0.25,
          0.5,
          0.75,
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
                        if (_playbackSpeed != playbackSpeed) {
                          Navigator.of(context).pop();
                          _controller.setPlaybackSpeed(playbackSpeed);
                          _playbackSpeed = playbackSpeed;
                          setState(() {});
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
                                if (_playbackSpeed == playbackSpeed) {
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

  // Video Player
  _buildVideoPlayer() {
    changeServer() {
      return WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        WoltModalSheet.show(
          context: context,
          pageListBuilder: (context) {
            final List<String> serverList = ['Pixeldrain', 'Kraken', 'Webview'];
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
                      childCount: serverList.length,
                      (context, index) {
                        String server = serverList[index];
                        return InkWell(
                          onTap: () async {
                            if (server == 'Webview') {
                              setState(() {
                                _server = 'webview';
                              });
                              if (server.toLowerCase() == 'webview') {
                                _controller.dispose();
                              }
                              Navigator.of(context).pop();
                            } else if (server != _server) {
                              Navigator.of(context).pop();
                              _server = server.toLowerCase();
                              final videoEndpoint =
                                  context.read<AnimeVideoBloc>().state;
                              context
                                  .read<AnimeVideoBloc>()
                                  .add(AnimeVideoEvent.getVideo(
                                    endpoint: videoEndpoint.endpoint,
                                    baseUrl: videoEndpoint.baseUrl,
                                    position: 0,
                                    server: server.toLowerCase(),
                                  ));
                              setState(() {});
                            }
                          },
                          borderRadius: kMainBorderRadius,
                          child: Center(
                            child: Padding(
                              padding: kAllPadding,
                              child: Text(
                                server,
                                style: TextStyle(
                                  color: () {
                                    if (_server.toLowerCase() ==
                                        server.toLowerCase()) {
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
      });
    }

    return BlocBuilder<AnimeVideoBloc, AnimeVideoState>(
      builder: (context, state) {
        if (_firstInstance) {
          if (_loading != state.loading) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              setState(() {
                _loading = state.loading;
              });
            });
          }
        }
        if (_loading && !_shifting) {
          return const SizedBox();
        } else {
          if (!_initialized && _title != state.videoList.first.title) {
            final UserPreferencesModel preferences =
                context.read<AnimePreferencesBloc>().state.preferences;
            _server = preferences.server!;
            _quality = preferences.resolution!;
            _playbackSpeed = preferences.playback!;
            _title = state.videoList.first.title;
            _server = preferences.server!;
            // initialize the endpoint
            _videoEndpoint = state.videoList.first.videoEndpoint;
            // change quality based on state
            for (var element in state.videoList) {
              if (element.videoEndpoint == '' &&
                  _server.toLowerCase() != 'webview') {
                changeServer();
                break;
              } else if (element.videoEndpoint != '') {
                // _title = state.videoList.first.title;
                _error = false;
              }
              if (element.quality == _quality) {
                _videoEndpoint = element.videoEndpoint;
              }
            }
            if (_shifting) {
              _controller.dispose();
            }

            final uri = Uri.parse(_videoEndpoint);
            _controller = VideoPlayerController.contentUri(uri)
              ..initialize().then(
                (value) {
                  _controller.play();
                  _controller.setPlaybackSpeed(_playbackSpeed);
                  _addAnimeHistory(state: state);
                  _position = state.videoList.first.position!;
                  WidgetsBinding.instance.addPostFrameCallback((_) async {
                    setState(() {
                      _initialized = true;
                      _firstInstance = false;
                      _buffering = false;
                      _shifting = false;
                      _shifting = false;
                      _loading = false;
                      _playing = true;
                    });
                  });
                  if (_position != 0) {
                    _controller.seekTo(Duration(seconds: _position));
                  }
                  _controller.addListener(
                    () {
                      _duration = _controller.value.duration.inSeconds;
                      _position = _controller.value.position.inSeconds;
                      _buffering = _controller.value.isBuffering;
                      _complete = _controller.value.isCompleted;
                      _sliderPosition = _position / _duration;
                      _complete = _controller.value.isCompleted;
                      if (_showControlDuration == 0 && _showControll == true) {
                        _hideControll(false);
                      }
                      setState(() {});
                    },
                  );
                  _autoHideControl();
                },
              );
          }

          return SizedBox(
            width: _width,
            height: _height,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoPlayer(_controller),
              ),
            ),
          );
        }
      },
    );
  }

  // Build genre
  _buildGenre(AnimeVideoState state, BuildContext context) {
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
                    color: primaryColor(context: context).withOpacity(0.2),
                    borderRadius: kMainBorderRadius,
                    border: Border.all(color: primaryColor(context: context)),
                  ),
                  child: Text(
                    state.videoList.first.genre[index],
                    style: headlineMedium(context: context),
                  ),
                ),
              ),
            );
          },
        )
            .animate(delay: 0.25.seconds, interval: 0.095.seconds)
            .slideX(begin: 1),
      ),
    );
  }

  _buildLoaded(AnimeVideoState state) {
    List<EpisodeModel> anotherEpisode = state.videoList.first.anotherEpisode;
    final double maxHeight = (heightMediaQuery(context: context));
    final double videoPlayerHeight =
        (widthMediaQuery(context: context) / 16 * 9);
    final double paddingHeight = paddingMediaQuery(context: context).vertical;
    double remainingHeight = maxHeight - videoPlayerHeight - paddingHeight;
    // kBottomNavigationBarHeight;
    if (_height != null) {
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
                  mainAxisAlignment: kMainAxisAligmentSpaceEvenly(),
                  children: [
                    AnimeVideoDescriptionButton(
                      icon: Iconsax.directbox_receive,
                      text: 'Download',
                      callback: () {
                        _downloadVideo(
                          title: state.videoList.first.title,
                          quality: _quality,
                          endpoint: _videoEndpoint,
                        );
                      },
                      widget: const SizedBox(),
                    ),
                    AnimeVideoDescriptionButton(
                      icon: Iconsax.send_2,
                      text: 'Share',
                      callback: () {
                        _shareWhatsApp(state: state);
                      },
                      widget: const SizedBox(),
                    ),
                    BlocBuilder<AnimeBookmarkBloc, AnimeBookmarkState>(
                      builder: (context, bookmarkState) {
                        for (var bookmark in bookmarkState.animeList) {
                          if (bookmark.poster ==
                              state.videoList.first.poster
                                  .replaceAll(kAnimeEndpoint, '')
                                  .trim()) {
                            return AnimeVideoDescriptionButton(
                              icon: Iconsax.archive_add1,
                              text: 'Saved',
                              callback: () {
                                context
                                    .read<AnimeBookmarkBloc>()
                                    .add(AnimeBookmarkEvent.removeAnimeList(
                                      poster: state.videoList.first.poster
                                          .split('/')
                                          .last
                                          .trim(),
                                    ));
                              },
                              widget: const SizedBox(),
                            );
                          }
                        }
                        return AnimeVideoDescriptionButton(
                          icon: Iconsax.archive_add,
                          text: 'Save',
                          callback: () {
                            context.read<AnimeBookmarkBloc>().add(
                                  AnimeBookmarkEvent.addAnimeList(
                                    anime: AnimeModel(
                                      title: state.videoList.first.title
                                          .split('Episode')
                                          .first
                                          .trim(),
                                      endpoint: state.videoList.first.baseUrl
                                          .replaceAll(kAnimeEndpoint, '')
                                          .trim(),
                                      poster: state.videoList.first.poster
                                          .replaceAll(kAnimeEndpoint, '')
                                          .trim(),
                                    ),
                                  ),
                                );
                          },
                          widget: const SizedBox(),
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: kAllPadding,
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: state.videoList.first.poster,
                        errorWidget: (context, url, error) => Center(
                            child: Icon(
                          Iconsax.danger,
                          color: backgroundColor(context: context)
                              .withOpacity(0.5),
                        )),
                        imageBuilder: (context, imageProvider) {
                          return CircleAvatar(
                            backgroundImage: imageProvider,
                          );
                        },
                      ),
                      Padding(
                        padding: kLeftPadding,
                        child: Text(
                          _server.replaceFirst(
                              _server[0], _server[0].toUpperCase()),
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
                        onPressed: () {
                          _changeServer(context: context);
                        },
                        child: Padding(
                          padding: kHorizontalPadding,
                          child: const Text('Change Server'),
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
                      return Stack(
                        children: [
                          Positioned(
                            child: CachedNetworkImage(
                              progressIndicatorBuilder:
                                  (context, url, progress) {
                                return _buildLoadingEpisode(
                                    context, anotherEpisode, index);
                              },
                              errorWidget: (context, url, error) {
                                return _buildLoadingEpisode(
                                    context, anotherEpisode, index);
                              },
                              imageUrl: anotherEpisode[index].thumbnail!,
                              imageBuilder: (context, imageProvider) {
                                return Column(
                                  children: [
                                    Image(image: imageProvider),
                                    Container(
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
                                    Padding(
                                      padding: kAllPadding,
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                kCrossAxisAlignmentStart(),
                                            children: [
                                              SizedBox(
                                                width: widthMediaQuery(
                                                      context: context,
                                                    ) -
                                                    2 * kPadding,
                                                child: Text(
                                                  anotherEpisode[index]
                                                      .title
                                                      .replaceAll(
                                                        'Episode ${anotherEpisode[index].episode}',
                                                        '',
                                                      ),
                                                  style: bodyMedium(
                                                    context: context,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              Text(
                                                '${anotherEpisode[index].date} | Episode ${anotherEpisode[index].episode}',
                                                style: bodySmall(
                                                  context: context,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onLongPress: () {
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
                                          // pageTitle: Padding(
                                          //   padding: kLeftPadding,
                                          //   child: Text(
                                          //     anotherEpisode[index].title,
                                          //     style: headlineLarge(
                                          //       context: context,
                                          //     ),
                                          //   ),
                                          // ),
                                          trailingNavBarWidget: InkWell(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              margin: kRightPadding,
                                              decoration: BoxDecoration(
                                                color: backgroundColor(
                                                  context: context,
                                                ).withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  50,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: kAllPadding,
                                                child: Icon(
                                                  Iconsax.close_circle,
                                                  color: onBackgroundColor(
                                                    context: context,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          heroImage: CachedNetworkImage(
                                            imageUrl: anotherEpisode[index]
                                                .thumbnail!,
                                            fit: BoxFit.cover,
                                          ),
                                          mainContentSlivers: [
                                            // Sliver
                                            SliverGrid(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                              ),
                                              delegate: SliverChildListDelegate(
                                                [
                                                  AnimeVideoDescriptionButton(
                                                    icon: Iconsax.send_2,
                                                    text: 'Share',
                                                    callback: () {
                                                      _shareWhatsApp(
                                                          state: state);
                                                    },
                                                    widget: const SizedBox(),
                                                  ),
                                                  AnimeVideoDescriptionButton(
                                                    icon: Iconsax
                                                        .directbox_receive,
                                                    text: 'Make Offline',
                                                    callback: () {
                                                      _downloadVideo(
                                                        title: anotherEpisode[
                                                                index]
                                                            .title,
                                                        quality: _quality,
                                                        endpoint:
                                                            _videoEndpoint,
                                                      );
                                                    },
                                                    widget: const SizedBox(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ];
                                    },
                                  );
                                },
                                onTap: () {
                                  _changeEpisode(
                                    endpoint: anotherEpisode[index].endpoint,
                                    title: anotherEpisode[index].title,
                                    thumbnail: anotherEpisode[index].thumbnail!,
                                    baseUrl: state.videoList.first.baseUrl,
                                  );
                                  _historyTimer.cancel();
                                },
                                splashColor: primaryColor(
                                  context: context,
                                ).withOpacity(
                                  0.1,
                                ),
                                highlightColor: primaryColor(
                                  context: context,
                                ).withOpacity(
                                  0.3,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  )
                      .animate(delay: 0.25.seconds, interval: 0.095.seconds)
                      .slideY(begin: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildLoadingEpisode(
      BuildContext context, List<EpisodeModel> anotherEpisode, int index) {
    return Column(
      children: [
        Container(
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
        Padding(
          padding: kAllPadding,
          child: Row(
            children: [
              // CircleAvatar(
              //   backgroundImage: imageProvider,
              // ),
              SizedBox(
                width: widthMediaQuery(
                      context: context,
                    ) -
                    2 * kPadding,
                child: Column(
                  crossAxisAlignment: kCrossAxisAlignmentStart(),
                  children: [
                    Text(
                      anotherEpisode[index].title.replaceAll(
                            'Episode ${anotherEpisode[index].episode}',
                            '',
                          ),
                      style: bodyMedium(
                        context: context,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      '${anotherEpisode[index].date} | Episode ${anotherEpisode[index].episode}',
                      style: bodySmall(
                        context: context,
                      ),
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
  }

  void _changeEpisode({
    required String endpoint,
    required String title,
    required String thumbnail,
    required String baseUrl,
  }) {
    _controller.pause();
    setState(() {
      _buffering = true;
      _initialized = false;
      _shifting = true;
      _thumbnail = thumbnail;
    });
    _bloc.add(
      AnimeVideoEvent.getVideo(
          endpoint: endpoint,
          baseUrl: baseUrl,
          position: 0,
          server:
              context.read<AnimePreferencesBloc>().state.preferences.server!),
    );
  }

  void _downloadVideo({
    required String title,
    required String quality,
    required String endpoint,
  }) {
    final DownloadParams params = DownloadParams(
      fileName: '$title ($quality)',
      url: endpoint,
    );
    context
        .read<AnimeDownloadBloc>()
        .add(AnimeDownloadEvent.download(params: params));
  }

  void _shareWhatsApp({required AnimeVideoState state}) {
    final String message =
        'Watch *${state.videoList.first.title}* on Raijin App and *Samehadaku.care*.\n\nTreat yourself to the ultimate anime experience—all in one app.\n\nExplore over *1000* captivating anime titles, all available on *samehadaku.care*.\n\nWatch on Samehadaku.care:\n$kAnimeEndpoint${state.videoList.first.baseUrl}\n\nWatch and Download:\n${state.videoList.first.videoEndpoint}\n\nVisit Samehadaku:\nhttps://samehadaku.care';
    final String encoded = Uri.encodeComponent(
      message,
    );
    UrlLauncherUseCase().call(
      params: 'whatsapp://send?text=$encoded',
    );
  }

  _buildLoading() {
    final double maxHeight = (heightMediaQuery(context: context));
    final double paddingHeight = paddingMediaQuery(context: context).vertical;
    double remainingHeight = maxHeight - paddingHeight;
    return Shimmer.fromColors(
      baseColor: onBackgroundColor(context: context).withOpacity(0.05),
      highlightColor: onBackgroundColor(context: context).withOpacity(0.1),
      child: SizedBox(
        height: remainingHeight,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: kCrossAxisAlignmentStart(),
            mainAxisAlignment: kMainAxisAligmentStart(),
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: onBackgroundColor(context: context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: kAllPadding,
                child: Container(
                  width: 190,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: kMainBorderRadius,
                    color: onBackgroundColor(context: context),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: kLeftPadding,
                      child: Container(
                        padding: kAllPadding,
                        width: 90,
                        decoration: BoxDecoration(
                          color: onBackgroundColor(context: context),
                          borderRadius: kMainBorderRadius,
                        ),
                        child: Text(
                          '',
                          style: headlineMedium(context: context),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: kAllPadding,
                child: Container(
                  width: 140,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: kMainBorderRadius,
                    color: onBackgroundColor(context: context),
                  ),
                ),
              ),
              Column(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: kBottomPadding,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: onBackgroundColor(context: context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
