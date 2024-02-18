import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/detail/domain/entities/episode_entity.dart';

class EpisodeCard extends StatelessWidget {
  final EpisodeEntity episodeEntity;
  final String thumbnail;
  const EpisodeCard({
    required Key? key,
    required this.episodeEntity,
    required this.thumbnail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kMainAccentColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: thumbnail,
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
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.01),
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.4),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    episodeEntity.title.split("Episode ")[1],
                    style: const TextStyle(
                      fontSize: 30,
                      color: kMainAccentColor,
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
                  episodeEntity.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(episodeEntity.date),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Dowloading ${episodeEntity.title}'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: Icon(
                Iconsax.document_download,
                color: Theme.of(context).primaryColor.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
