import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';

class AnimePopularCardWidget extends StatelessWidget {
  const AnimePopularCardWidget({
    super.key,
    required this.animeModel,
    required this.index,
  });
  final int index;
  final AnimeModel animeModel;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: animeModel.poster,
      imageBuilder: (context, imageProvider) {
        return Column(
          mainAxisAlignment: kMainAxisAligmentStart(),
          crossAxisAlignment: kCrossAxisAlignmentStart(),
          children: [
            Stack(
              children: [
                Container(
                  width: widthMediaQuery(context: context) / 2.3,
                  height: heightMediaQuery(context: context) / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: kMainBorderRadius,
                  ),
                ),
                Positioned(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: kTopLeftBorderRadius,
                      color: primaryColor(
                        context: context,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '$index',
                        style: bodyLarge(context: context).copyWith(
                          color: backgroundColor(context: context),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: kMainBorderRadius,
                      gradient: LinearGradient(
                        colors: gradientListColor(context: context),
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Row(
                    mainAxisAlignment: kMainAxisAligmentCenter(),
                    crossAxisAlignment: kCrossAxisAlignmentCenter(),
                    children: [
                      const Icon(
                        Iconsax.star1,
                        color: Colors.amber,
                        size: 14,
                      ),
                      Text(
                        '${animeModel.score}/10',
                        style: bodyMedium(context: context).copyWith(
                          color: backgroundColor(context: context),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: widthMediaQuery(context: context) / 2.3,
              height: heightMediaQuery(context: context) / 3,
              child: Text(
                animeModel.title,
                style: bodyLarge(context: context),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ],
        );
      },
    );
  }
}
