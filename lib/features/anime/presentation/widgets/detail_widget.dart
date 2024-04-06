import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raijin/core/commons/widgets/anime_card_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_detail_bloc/anime_detail_bloc.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AnimeDetailBloc, AnimeDetailState>(
          builder: (context, state) {
            return state.when(
              initial: () => Container(),
              loading: () => const Center(child: CupertinoActivityIndicator()),
              loaded: (animeModel) {
                return _buildLoaded(animeModel, context);
              },
              error: (message) => Text(message),
            );
          },
        ),
      ),
    );
  }

  _buildLoaded(AnimeModel animeModel, BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CachedNetworkImage(
            imageUrl: animeModel.poster,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(),
          ),
        ),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Container(),
              foregroundColor: onBackgroundColor(context: context),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  width: double.maxFinite,
                  padding: kAllPadding,
                  decoration: BoxDecoration(
                    // color: backgroundColor(context: context),
                    borderRadius: kTopBorderRadius,
                  ),
                  child: Center(
                    child: Container(
                      width: 60,
                      height: 4,
                      decoration: BoxDecoration(
                        color: onBackgroundColor(context: context),
                        borderRadius: kMainBorderRadius,
                      ),
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              scrolledUnderElevation: 0,
              expandedHeight: heightMediaQuery(context: context) * 0.5,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  imageUrl: animeModel.poster,
                  imageBuilder: (context, imageProvider) => Stack(
                    children: [
                      Positioned.fill(
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(180 / 360),
                          child: Image(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                          child: Container(),
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        left: 25,
                        child: AnimeCardWidget(
                          animeModel: animeModel,
                          removeTitle: true,
                          mode: 'large',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: DefaultTabController(
                length: 3,
                child: SizedBox(
                  height: heightMediaQuery(context: context) * 0.9,
                  child: Column(
                    children: [
                      TabBar(
                        splashBorderRadius: kMainBorderRadius,
                        dividerColor:
                            Theme.of(context).primaryColor.withOpacity(0),
                        labelStyle: const TextStyle(color: kMainAccentColor),
                        tabs: const [
                          Tab(
                            child: Text('Overview'),
                          ),
                          Tab(
                            child: Text('Episodes'),
                          ),
                          Tab(
                            child: Text('Details'),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _buildOverview(animeModel, context),
                            _buildEpisodes(animeModel),
                            Padding(
                              padding: kMainPadding,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        kMainAxisAligmentCenter(),
                                    children: [
                                      Text(
                                        animeModel.title,
                                        style: bodyLarge(context: context),
                                      ),
                                      Text(
                                        ' (Title)',
                                        style: bodySmall(context: context),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        kMainAxisAligmentCenter(),
                                    children: [
                                      Text(
                                        animeModel.japanese!,
                                        style: bodyLarge(context: context),
                                      ),
                                      Text(
                                        ' (Japanese)',
                                        style: bodySmall(context: context),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        kMainAxisAligmentCenter(),
                                    children: [
                                      Text(
                                        animeModel.english! == ''
                                            ? 'Unknown'
                                            : animeModel.english!,
                                        style: bodyLarge(context: context),
                                      ),
                                      Text(
                                        ' (English)',
                                        style: bodySmall(context: context),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        kMainAxisAligmentSpaceEvenly(),
                                    children: [
                                      EpisodeStatWidget(
                                        title: 'Episodes',
                                        subtitle: '${animeModel.totalEpisode!}',
                                      ),
                                      const SeparatorWidget(),
                                      EpisodeStatWidget(
                                        title: 'Status',
                                        subtitle: animeModel.status!,
                                      ),
                                      const SeparatorWidget(),
                                      EpisodeStatWidget(
                                        title: 'Duration',
                                        subtitle: animeModel.duration!,
                                      ),
                                      const SeparatorWidget(),
                                      EpisodeStatWidget(
                                        title: 'Studio',
                                        subtitle: animeModel.studio!,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  SingleChildScrollView _buildEpisodes(AnimeModel animeModel) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          animeModel.episodeList!.length,
          (index) => ListTile(
            leading: CachedNetworkImage(
              imageUrl: animeModel.poster,
            ),
            title: Text(animeModel.episodeList![index].title),
            subtitle: Text(
              animeModel.episodeList![index].date,
            ),
          ),
        ),
      ),
    );
  }

  Column _buildOverview(AnimeModel animeModel, BuildContext context) {
    return Column(
      crossAxisAlignment: kCrossAxisAlignmentStart(),
      children: [
        Padding(
          padding: kHorizontalPadding,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: kCrossAxisAlignmentStart(),
                  children: [
                    Text(
                      animeModel.title,
                      style: headlineLarge(context: context)
                          .copyWith(fontSize: 30),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      '${animeModel.season!} | ${animeModel.genre![0].replaceFirst(
                        animeModel.genre![0][0],
                        animeModel.genre![0][0].toUpperCase(),
                      )} | ${animeModel.status}',
                      style: bodySmall(context: context),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          // height: heightMediaQuery(context: context) / 3,
          child: Padding(
            padding: kHorizontalPadding,
            child: Column(
              crossAxisAlignment: kCrossAxisAlignmentStart(),
              children: [
                Text(
                  'Synopsis',
                  style: bodyLarge(context: context),
                ),
                Text(
                  animeModel.description!,
                  // overflow: TextOverflow.ellipsis,
                  // maxLines: 14,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EpisodeStatWidget extends StatelessWidget {
  const EpisodeStatWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthMediaQuery(context: context) / 4 - (90 / 4),
      child: Column(
        children: [
          Text(title),
          Text(
            subtitle,
            style: bodySmall(context: context),
          ),
        ],
      ),
    );
  }
}

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHorizontalPadding,
      child: Container(
        height: 60,
        width: 2,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
      ),
    );
  }
}
