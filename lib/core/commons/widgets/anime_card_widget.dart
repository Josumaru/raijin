import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_detail_bloc/anime_detail_bloc.dart';
import 'package:raijin/features/anime/presentation/pages/detail_page.dart';

class AnimeCardWidget extends StatelessWidget {
  const AnimeCardWidget({
    super.key,
    required this.animeModel,
    this.index,
    required this.removeTitle,
    required this.mode,
  });
  final int? index;
  final String mode;
  final AnimeModel animeModel;
  final bool removeTitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _goToDetail(endpoint: animeModel.endpoint, context: context);
      },
      child: CachedNetworkImage(
        imageUrl: animeModel.poster,
        imageBuilder: (context, imageProvider) {
          return Column(
            mainAxisAlignment: kMainAxisAligmentStart(),
            crossAxisAlignment: kCrossAxisAlignmentStart(),
            children: [
              Stack(
                children: [
                  Container(
                    width: mode == 'large'
                        ? 200
                        : (widthMediaQuery(context: context) / 3) - (40 / 3),
                    height: mode == 'large'
                        ? 300
                        : heightMediaQuery(context: context) / 4.5,
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
                          left: () {
                            switch (mode) {
                              case 'large':
                                return 20.0;
                              default:
                                return 5.0;
                            }
                          }(),
                          bottom: () {
                            switch (mode) {
                              case 'large':
                                return 20.0;
                              default:
                                return 5.0;
                            }
                          }(),
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
                    bottom: mode == 'large' ? 20 : 5,
                    left: () {
                      switch (mode) {
                        case 'large':
                          return index == null ? null : 20.0;
                        default:
                          return index == null ? null : 5.0;
                      }
                    }(),
                    right: () {
                      switch (mode) {
                        case 'large':
                          return index == null ? 20.0 : null;
                        default:
                          return index == null ? 5.0 : null;
                      }
                    }(),
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
              () {
                if (removeTitle) {
                  return Container();
                }
                return SizedBox(
                  width: (widthMediaQuery(context: context) / 3) - (40 / 3),
                  height: 40,
                  child: Text(
                    animeModel.title,
                    style: bodyLarge(context: context),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                );
              }()
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
