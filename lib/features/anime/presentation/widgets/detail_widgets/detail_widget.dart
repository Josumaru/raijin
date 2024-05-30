import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:raijin/core/commons/widgets/anime_card_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_detail_bloc/anime_detail_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_preferences/anime_preferences_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_video_bloc/anime_video_bloc.dart';
import 'package:raijin/features/anime/presentation/pages/video_page.dart';
import 'package:raijin/features/anime/presentation/widgets/trailer_widgets/trailer_widget.dart';
import 'package:shimmer/shimmer.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({super.key});

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  late int _episodeLength;
  late bool _reversed;

  @override
  void initState() {
    _episodeLength = 12;
    _reversed = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AnimeDetailBloc, AnimeDetailState>(
          builder: (context, state) {
            return state.when(
              initial: () => Container(),
              loading: () => _buildLoading(),
              loaded: (animeModel) {
                return _buildLoaded(animeModel, context);
              },
              error: (message) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.of(context).pop();
                });
                return Container();
              },
            );
          },
        ),
      ),
    );
  }

  _buildLoading() {
    return Shimmer.fromColors(
      baseColor: onBackgroundColor(context: context).withOpacity(0.1),
      highlightColor: onBackgroundColor(context: context).withOpacity(0.3),
      child: Stack(
        children: [
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
                  background: Stack(
                    children: [
                      Positioned(
                        bottom: 50,
                        left: 25,
                        child: Container(
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            color: onBackgroundColor(context: context)
                                .withOpacity(0.3),
                            borderRadius: kMainBorderRadius,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: heightMediaQuery(context: context),
                      color:
                          onBackgroundColor(context: context).withOpacity(0.3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildLoaded(AnimeModel animeModel, BuildContext context) {
    return Stack(
      children: [
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
                      Positioned(
                        bottom: 50,
                        left: 25,
                        child: AnimeCardWidget(
                          animeModel: animeModel,
                          removeTitle: true,
                          mode: 'large',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildOverview(animeModel, context),
          ],
        ),
      ],
    );
  }

  SliverToBoxAdapter _buildOverview(
      AnimeModel animeModel, BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: kMainPadding,
        child: Column(
          mainAxisAlignment: kMainAxisAligmentStart(),
          crossAxisAlignment: kCrossAxisAlignmentStart(),
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: widthMediaQuery(context: context),
                child: Column(
                  mainAxisAlignment: kMainAxisAligmentCenter(),
                  crossAxisAlignment: kCrossAxisAlignmentCenter(),
                  children: [
                    Row(
                      mainAxisAlignment: kMainAxisAligmentCenter(),
                      crossAxisAlignment: kCrossAxisAlignmentCenter(),
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
                      mainAxisAlignment: kMainAxisAligmentCenter(),
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
                      mainAxisAlignment: kMainAxisAligmentCenter(),
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
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: kMainAxisAligmentSpaceEvenly(),
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
            ),
            Padding(
              padding: kVerticalPadding,
              child: Text(
                animeModel.description!,
                style: bodySmall(context: context).copyWith(
                  color: onBackgroundColor(context: context).withOpacity(0.6),
                ),
              ),
            ),
            Padding(
              padding: kVerticalPadding,
              child: Row(
                children: [
                  Text(
                    'Episode',
                    style: bodyLarge(context: context),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => setState(() {
                      _reversed = !_reversed;
                    }),
                    borderRadius: kMainBorderRadius,
                    child: Row(
                      children: [
                        Padding(
                          padding: kHorizontalPadding,
                          child: Text(
                            'Reverse',
                            style: bodySmall(context: context),
                          ),
                        ),
                        Icon(
                          Iconsax.arrange_circle_2,
                          color: onBackgroundColor(context: context)
                              .withOpacity(.5),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: widthMediaQuery(context: context) /
                  6 *
                  (_episodeLength > animeModel.episodeList!.length
                          ? animeModel.episodeList!.length / 6
                          : _episodeLength / 6)
                      .ceil(),
              width: widthMediaQuery(context: context),
              child: GridView.count(
                crossAxisCount: 6,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  animeModel.episodeList!.length > _episodeLength
                      ? _episodeLength
                      : animeModel.episodeList!.length,
                  (index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: primaryColor(context: context).withOpacity(0.05),
                        borderRadius: kMainBorderRadius,
                        border: Border.all(
                          width: 0.5,
                          color: primaryColor(
                            context: context,
                          ),
                        ),
                      ),
                      child: Center(
                        child: index == _episodeLength - 1
                            ? InkWell(
                                borderRadius: kMainBorderRadius,
                                onTap: () {
                                  setState(() {
                                    _episodeLength = _episodeLength + 12;
                                  });
                                },
                                child: const Center(
                                  child: Icon(Iconsax.arrow_right_3),
                                ),
                              )
                            : InkWell(
                                borderRadius: kMainBorderRadius,
                                onTap: () {
                                  context.read<AnimeVideoBloc>().add(
                                        AnimeVideoEvent.getVideo(
                                          endpoint: (_reversed
                                                  ? animeModel
                                                      .episodeList!.reversed
                                                  : animeModel.episodeList!)
                                              .toList()[index]
                                              .endpoint,
                                          baseUrl: animeModel.endpoint,
                                          position: 0,
                                          server: context
                                                  .read<AnimePreferencesBloc>()
                                                  .state
                                                  .preferences
                                                  .server ??
                                              'kraken',
                                        ),
                                      );
                                  PersistentNavBarNavigator
                                      .pushNewScreenWithRouteSettings(
                                    context,
                                    withNavBar: false,
                                    screen: const VideoPage(),
                                    settings: const RouteSettings(
                                      name: '/video',
                                    ),
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    (_reversed
                                            ? animeModel.episodeList!.reversed
                                            : animeModel.episodeList!)
                                        .toList()[index]
                                        .episode
                                        .toString(),
                                    style: bodyLarge(context: context)
                                        .copyWith(fontSize: 20),
                                  ),
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ),
            ),
            TrailerWidget(url: animeModel.trailer!),
          ],
        ),
      ),
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
