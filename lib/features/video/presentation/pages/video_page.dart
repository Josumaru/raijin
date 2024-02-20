import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/features/anime/presentation/bloc/anime/anime_bloc.dart';
import 'package:raijin/features/anime/presentation/bloc/complete_anime/complete_anime_bloc.dart';
import 'package:raijin/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:raijin/features/video/presentation/bloc/video_bloc.dart';
import 'package:raijin/features/video/presentation/widgets/custom_video_player_widget.dart';
import 'package:raijin/features/video/presentation/widgets/episode_widget.dart';
import 'package:raijin/features/video/presentation/widgets/recomendation_widget.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<AnimeBloc, AnimeState>(
      builder: (context, animeState) {
        return BlocBuilder<DetailBloc, DetailState>(
          builder: (context, detailState) {
            return BlocBuilder<VideoBloc, VideoState>(
              builder: (context, videoState) {
                if (videoState is VideoLoading) {
                 return SafeArea(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 16/9,
                            child: Center(
                              child: CupertinoActivityIndicator(color: Theme.of(context).primaryColor,),
                            ),
                          ),
                          _buildTab(
                            detailState: context.read<DetailBloc>().state,
                            animeState: animeState,
                            // videoState: videoState,
                            completeAnimeState: context.read<CompleteAnimeBloc>().state,
                            context: context,
                          )
                        ],
                      ),
                    )
                 );
                } else if (videoState is VideoLoaded) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          _buildVideoPlayer(videoState),
                          _buildTab(
                            detailState: context.read<DetailBloc>().state,
                            animeState: context.read<AnimeBloc>().state,
                            // videoState: videoState,
                            completeAnimeState: context.read<CompleteAnimeBloc>().state,
                            context: context,
                          )
                        ],
                      ),
                    ),
                  );
                }
                return const Center(
                  child: Icon(Iconsax.emoji_sad),
                );
              },
            );
          },
        );
      },
    );
  }

  _buildVideoPlayer(VideoLoaded videoState) =>
      CustomVideoPlayerWidget(videoEntity: videoState.videoEntity);

  _buildTab({
    required DetailState detailState,
    required AnimeState animeState,
    // required VideoState videoState,
    required CompleteAnimeState completeAnimeState,
    required BuildContext context,
  }) {
    if ((detailState is DetailLoaded) &&
        (animeState is AnimeOngoingLoaded) &&
        // (videoState is VideoLoaded) &&
        (completeAnimeState is CompleteAnimeLoaded) &&
        (MediaQuery.of(context).orientation == Orientation.portrait)) {
      return DefaultTabController(
        length: 3,
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 40,
          child: Column(
            children: [
              TabBar(
                splashBorderRadius: BorderRadius.circular(3),
                labelStyle: const TextStyle(color: kMainAccentColor),
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                overlayColor: MaterialStateProperty.all(Theme.of(context).primaryColor.withOpacity(0.2)),
                unselectedLabelColor: Theme.of(context).disabledColor,
                indicatorSize: TabBarIndicatorSize.tab,
                automaticIndicatorColorAdjustment: true,
                indicatorColor: kMainAccentColor,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Theme.of(context).primaryColor.withOpacity(0),
                tabs: [
                  Tab(
                    child: Row(
                      children: [
                        const Icon(Iconsax.video_square),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Detail",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        const Icon(Iconsax.messages4),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Comments",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(Iconsax.activity),
                        Text(
                          "Ongoing",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    child: Text(
                                      detailState.detailEntity.title,
                                      style: Theme.of(context).textTheme.bodyLarge,
                                      maxLines: 5,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                    ),
                                    child: ExpansionTile(
                                      expandedAlignment: Alignment.topLeft,
                                      expandedCrossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      title: Text(
                                        '',
                                        style:
                                            Theme.of(context).textTheme.bodyLarge,
                                        maxLines: 5,
                                        textAlign: TextAlign.start,
                                      ),
                                      children: [
                                        DetailWidget(
                                          option: 'Japanese',
                                          detail: detailState.detailEntity.japanese,
                                        ),
                                        DetailWidget(
                                          option: 'Genre',
                                          detail: detailState.detailEntity.genre,
                                        ),
                                        DetailWidget(
                                          option: 'Producer',
                                          detail: detailState.detailEntity.producer,
                                        ),
                                        DetailWidget(
                                          option: 'Studio',
                                          detail: detailState.detailEntity.studio,
                                        ),
                                        DetailWidget(
                                          option: 'Release',
                                          detail:
                                              detailState.detailEntity.releaseDate,
                                        ),
                                        DetailWidget(
                                          option: 'Status',
                                          detail: detailState.detailEntity.status,
                                        ),
                                        DetailWidget(
                                          option: 'Total Episode',
                                          detail: detailState.detailEntity.totalEpisode,
                                        ),
                                        DetailWidget(
                                          option: 'Type',
                                          detail: detailState.detailEntity.type,
                                        ),
                                        DetailWidget(
                                          option: 'Score',
                                          detail: detailState.detailEntity.score,
                                        ),
                                        DetailWidget(
                                          option: 'Synopsis',
                                          detail: detailState.detailEntity.synopsis,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Icon(
                                    Iconsax.flash_14,
                                    color: Theme.of(context).primaryColor,
                                    size: 15,
                                  ),
                                ),
                                Text(
                                  'Try Premium!',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    10,
                                    0,
                                  ),
                                  child: Icon(
                                    Iconsax.arrow_right_3,
                                    size: 15,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  true
                                      ? Icon(Iconsax.like4)
                                      : Icon(Iconsax.like5),
                                  Text("Like"),
                                ],
                              ),
                              Column(
                                children: [
                                  false
                                      ? Icon(Iconsax.archive_add4)
                                      : Icon(Iconsax.archive_add1),
                                  Text("Save"),
                                ],
                              ),
                              Column(
                                children: [
                                  true
                                      ? Icon(Iconsax.import_24)
                                      : Icon(Iconsax.arrow_down_24),
                                  Text("Download"),
                                ],
                              ),
                              Column(
                                children: [
                                  true
                                      ? Icon(Iconsax.danger)
                                      : Icon(Iconsax.danger),
                                  Text("Report"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Text(
                                'Episodes',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  final lastEpisode = detailState.detailEntity.episodes[0];
                                  context.read<VideoBloc>().add(GetVideoEvent(episodeEntity: lastEpisode));
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Updated to Episode ${detailState.detailEntity.episodes[0].title.split('Episode')[1]}',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const Icon(
                                      Iconsax.arrow_right_3,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              detailState.detailEntity.episodes.length,
                              (index) => Padding(
                                padding: EdgeInsets.fromLTRB(
                                  (index == 0) ? 20 : 5,
                                  0,
                                  (index == detailState.detailEntity.episodes.length - 1) ? 20 : 0,
                                  0,
                                ),
                                child: EpisodeWidget(
                                  episodeEntity: detailState.detailEntity.episodes[(detailState.detailEntity.episodes.length-1) - index],
                                  episode: index + 1,
                                  selected: context.watch<VideoBloc>().state.videoEntity[0].episode == index + 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recommendation',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 2.5,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      animeState.animeEntity.length,
                                      (index) => RecommendationWidget(
                                        animeEntity:
                                            animeState.animeEntity[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        'Comments disabled',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          children: List.generate(
                            animeState.animeEntity.length,
                            (index) => RecommendationWidget(
                              animeEntity: animeState.animeEntity[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    super.key,
    required this.option,
    required this.detail,
  });
  final String detail, option;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          option,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          detail == '' ? 'Unavailable' : detail,
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 5,
        ),
      ],
    );
  }
}
