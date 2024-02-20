import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:raijin/features/detail/presentation/widgets/episode_card.dart';
import 'package:raijin/features/video/presentation/bloc/video_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is DetailLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is DetailLoaded) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CachedNetworkImage(
                          imageUrl: state.detailEntity.thumbnail,
                          imageBuilder: (context, imageProvider) => ClipPath(
                            clipper: CustomClipperPath(),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Theme.of(context)
                                          .scaffoldBackgroundColor
                                          .withOpacity(0.2),
                                      Theme.of(context)
                                          .scaffoldBackgroundColor
                                          .withOpacity(1),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 360,
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Iconsax.share,
                                    size: 25,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  const SizedBox(height: 10),
                                  Icon(
                                    Iconsax.bookmark_2,
                                    size: 25,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  const SizedBox(height: 10),
                                  Icon(
                                    Iconsax.notification,
                                    size: 25,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 360,
                                left: 30,
                                right: 30,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed('/video');
                                  context.read<VideoBloc>().add(GetVideoEvent(episodeEntity : state.detailEntity.episodes[0]));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: const Icon(
                                        Iconsax.play,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      state.detailEntity.title,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Text(
                                      state.detailEntity.japanese,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Iconsax.star1),
                                        Text(
                                          (state.detailEntity.score == "")
                                              ? "Unrated"
                                              : state.detailEntity.score,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        )
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          _buildStats(
                                            context: context,
                                            stats: 'Status',
                                            stat: state.detailEntity.status,
                                          ),
                                          _buildStats(
                                            context: context,
                                            stats: 'Duration',
                                            stat: state.detailEntity.duration,
                                          ),
                                          _buildStats(
                                            context: context,
                                            stats: 'Studio',
                                            stat: state.detailEntity.studio.split(',')[0].trim(),
                                          ),
                                          _buildStats(
                                            context: context,
                                            stats: 'Genre',
                                            stat: state.detailEntity.genre
                                                .split(',')[0],
                                          ),
                                          _buildStats(
                                            context: context,
                                            stats: 'Episodes',
                                            stat: state.detailEntity.totalEpisode == "Unknown" ? '${state.detailEntity.episodes[0].episode} +' : '${state.detailEntity.totalEpisode} EP',
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      // (state.detailEntity.synopsis == "")
                                      //     ? "Synopsis Unavaible"
                                      //     : 
                                      state.detailEntity.synopsis,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(
                                        0.1,
                                      ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Iconsax.arrow_left_1,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(
                        state.detailEntity.episodes.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/video');
                              context.read<VideoBloc>().add(GetVideoEvent(episodeEntity : state.detailEntity.episodes[index]));
                            },
                            child: EpisodeCard(
                              key: key,
                              episodeEntity: state.detailEntity.episodes[index],
                              thumbnail: state.detailEntity.thumbnail,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  _buildStats({
    required BuildContext context,
    required String stats,
    required String stat,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 6,
      // height: 200,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              stats,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              stat,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCircle(
        center: Offset(
          size.width * 0.5,
          90.0,
        ),
        radius: 300,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
