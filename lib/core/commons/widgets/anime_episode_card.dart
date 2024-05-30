import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/data/models/episode_model/episode_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_preferences/anime_preferences_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_video_bloc/anime_video_bloc.dart';
import 'package:raijin/features/anime/presentation/pages/video_page.dart';

class AnimeEpisodeCard extends StatelessWidget {
  final EpisodeModel episodeModel;
  final String poster;
  const AnimeEpisodeCard({
    super.key,
    required this.episodeModel,
    required this.poster,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: kMainBorderRadius,
      onTap: () {
        AnimeModel animeModel = AnimeModel(
          endpoint: episodeModel.endpoint,
          poster: poster,
          title: episodeModel.title,
        );

        _play(
          endpoint: episodeModel.endpoint,
          animeModel: animeModel,
          context: context,
          position: 0,
          server: context.read<AnimePreferencesBloc>().state.preferences.server!,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor(context: context).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: poster,
              imageBuilder: (context, imageProvider) => Container(
                width: 70,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        backgroundColor(context: context).withOpacity(0.01),
                        backgroundColor(context: context).withOpacity(0.4),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      episodeModel.title.contains('[END]')
                          ? 'END'
                          : episodeModel.title.split("Episode ").last,
                      style: TextStyle(
                        fontSize: 30,
                        color: primaryColor(context: context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    episodeModel.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  Text(episodeModel.date),
                ],
              ),
            ),
            const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: GestureDetector(
            //     onTap: () {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text('Dowloading ${episodeModel.title}'),
            //           duration: const Duration(seconds: 1),
            //         ),
            //       );
            //     },
            //     child: Icon(
            //       Iconsax.document_download,
            //       color: Theme.of(context).primaryColor.withOpacity(0.4),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  _play(
      {required String endpoint,
      required AnimeModel animeModel,
      required BuildContext context,
      required int position,
      required String server,
      }) {
    context.read<AnimeVideoBloc>().add(
          AnimeVideoEvent.getVideo(
            endpoint: endpoint,
            baseUrl: animeModel.endpoint,
            position: position,
            server: server,
          ),
        );
    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
      context,
      withNavBar: false,
      screen: const VideoPage(),
      settings: const RouteSettings(name: '/video'),
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
