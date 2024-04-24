import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:raijin/core/commons/widgets/anime_episode_card.dart';
import 'package:raijin/core/commons/widgets/anime_episode_card_shimmer.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_video_bloc/anime_video_bloc.dart';
import 'package:raijin/features/anime/presentation/widgets/video_widgets/video_player_widget.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AnimeVideoBloc, AnimeVideoState>(
          builder: (context, state) {
            return state.when(
                initial: () => Container(),
                loading: () => const LoadingWidget(),
                loaded: (videoModel) {
                  return Column(
                    mainAxisAlignment: kMainAxisAligmentStart(),
                    crossAxisAlignment: kCrossAxisAlignmentStart(),
                    children: [
                      VideoPlayerWidget(videoModel: videoModel),
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? Padding(
                              padding: kMainPadding,
                              child: Text(
                                'Another Episodes',
                                style: bodyLarge(context: context),
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: List.generate(
                              videoModel[0].anotherEpisode.length,
                              (index) => Padding(
                                padding: kMainPadding,
                                child: AnimeEpisodeCard(
                                  episodeModel:
                                      videoModel[0].anotherEpisode[index],
                                  poster: videoModel[0]
                                      .anotherEpisode[index]
                                      .poster!,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
                error: (message) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    Navigator.of(context).pop();
                  });
                  return Container();
                });
          },
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: kMainAxisAligmentStart(),
      crossAxisAlignment: kCrossAxisAlignmentStart(),
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              color: onBackgroundColor(context: context).withOpacity(0),
            ),
            child: Center(
              child: LoadingAnimationWidget.stretchedDots(
                color: backgroundColor(context: context),
                size: 40,
              ),
            ),
          ),
        ),
        // const SizedBox(height: 10),
        // Padding(
        //   padding: kMainPadding,
        //   child: Shimmer.fromColors(
        //     baseColor: onBackgroundColor(context: context).withOpacity(0.1),
        //     highlightColor:
        //         onBackgroundColor(context: context).withOpacity(0.3),
        //     child: Container(
        //       width: 140,
        //       height: 18,
        //       decoration: BoxDecoration(
        //         borderRadius: kMainBorderRadius / 2,
        //         color: backgroundColor(context: context),
        //       ),
        //     ),
        //   ),
        // ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: kMainPadding,
                  child: const AnimeEpisodeCardShimmer(),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
