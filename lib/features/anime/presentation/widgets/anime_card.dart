import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/features/anime/domain/entities/anime_entity.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({Key? key, required this.animeEntity}) : super(key: key);

  final AnimeEntity animeEntity;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: animeEntity.thumbnail,
      imageBuilder: (context, imageProvider) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(1),
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 3.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              color: kMainAccentColor,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.topCenter,
                colors: [
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
                ],
              ),
            ),
            child: Stack(
              // alignment: Alignment.topLeft,
              children: [
                Positioned(
                  right: 0,
                  child: Container(
                    // width: MediaQuery.of(context).size.width / 3.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text(
                      animeEntity.date,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'EP-${animeEntity.episode}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  )
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3.5,
            height: 50,
            child: Text(
              animeEntity.title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      progressIndicatorBuilder: (context, url, progress) => Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 3.5,
        child: const Center(
          child: CupertinoActivityIndicator(
            color: kMainAccentColor,
          ),
        ),
      ),
    );
  }
}
