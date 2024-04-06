import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:raijin/core/commons/widgets/anime_card_shimmer_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_detail_bloc/anime_detail_bloc.dart';
import 'package:raijin/features/anime/presentation/pages/detail_page.dart';

class AnimePopularCardWidget extends StatelessWidget {
  const AnimePopularCardWidget({
    super.key,
    required this.animeModel,
    this.index,
  });
  final int? index;
  final AnimeModel animeModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _goToDetail(endpoint: animeModel.endpoint, context: context);
      },
      child: CachedNetworkImage(
        imageUrl: animeModel.poster,
        errorWidget: (context, url, error) => Container(),
        imageBuilder: (context, imageProvider) {
          return Column(
            mainAxisAlignment: kMainAxisAligmentStart(),
            crossAxisAlignment: kCrossAxisAlignmentStart(),
            children: [
              Stack(
                children: [
                  Container(
                    width: (widthMediaQuery(context: context) / 3) - (40 / 3),
                    height: heightMediaQuery(context: context) / 4.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: kMainBorderRadius,
                    ),
                  ),
                  animeModel.status! == 'Completed'
                      ? Positioned(
                          right: 5,
                          top: 5,
                          child: Container(
                            padding: kHorizontalPadding,
                            decoration: BoxDecoration(
                              color: primaryColor(context: context),
                              borderRadius: kMainBorderRadius / 4,
                            ),
                            child: const Text('END'),
                          ),
                        )
                      : Container(),
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
                  index == null
                      ? Positioned(
                          left: 5,
                          bottom: 5,
                          child: Container(
                            width: 50,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: kTopLeftBottomRightBorderRadius,
                              color: () {
                                switch (animeModel.type!) {
                                  case 'TV':
                                    return Colors.redAccent;
                                  case 'OVA':
                                    return Colors.amberAccent;
                                  case 'ONA':
                                    return Colors.greenAccent;
                                  case 'SPECIAL':
                                    return Colors.blueAccent;
                                  case 'MOVIE':
                                    return Colors.limeAccent;
                                  default:
                                    return primaryColor(context: context);
                                }
                              }(),
                            ),
                            child: Center(
                              child: Text(
                                animeModel.type!,
                                style: bodyLarge(context: context).copyWith(
                                  color: kMainDarkTextColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Positioned(
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: kTopLeftBottomRightBorderRadius,
                              color: primaryColor(
                                context: context,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '$index',
                                style: bodyLarge(context: context).copyWith(
                                  color: kMainDarkTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                  Positioned(
                    bottom: 5,
                    left: index == null ? null : 5,
                    right: index == null ? 5 : null,
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
                          '${animeModel.score}',
                          style: bodyMedium(context: context).copyWith(
                            color: kMainDarkTextColor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                width: (widthMediaQuery(context: context) / 3) - (40 / 3),
                height: 40,
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
      ),
    );
  }

  _goToDetail({required String endpoint, required BuildContext context}) {
    context.read<AnimeDetailBloc>().add(
          AnimeDetailEvent.animeGetDetail(endpoint: endpoint),
        );
    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
      context,
      screen: const DetailPage(),
      settings: const RouteSettings(name: '/detail'),
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
