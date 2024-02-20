
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raijin/features/anime/domain/entities/anime_entity.dart';
import 'package:raijin/features/detail/presentation/bloc/detail_bloc.dart';

class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({
    super.key,
    required this.animeEntity,
  });

  final AnimeEntity animeEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<DetailBloc>().add(GetDetailEvent(endpoint: animeEntity.endpoint!));
        Navigator.of(context).popAndPushNamed('/detail');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: animeEntity.thumbnail!,
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                );
              },
            ),
            SizedBox(
              height: 75,
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      animeEntity.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Updated to Episode ${animeEntity.episode}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
