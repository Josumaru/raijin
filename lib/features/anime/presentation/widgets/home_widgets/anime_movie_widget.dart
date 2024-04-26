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
import 'package:raijin/core/usecases/more_usecase/more_use_case.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_detail_bloc/anime_detail_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_movie_bloc/anime_movie_bloc.dart';
import 'package:raijin/features/anime/presentation/pages/detail_page.dart';

class AnimeMovieWidget extends StatelessWidget {
  const AnimeMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeMovieBloc, AnimeMovieState>(
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Text('Loading'),
          loaded: (animeModel) => Padding(
            padding: kHorizontalPadding,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: kCrossAxisAlignmentCenter(),
                  children: [
                    Text(
                      'Anime Movie',
                      style: headlineLarge(context: context).copyWith(
                        color: onBackgroundColor(context: context),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      borderRadius: kMainBorderRadius,
                      onTap: () {
                        _buildMore(context);
                      },
                      child: Padding(
                        padding: kLeftPadding,
                        child: Row(
                          children: [
                            Text(
                              'View All',
                              style: bodySmall(context: context),
                            ),
                            Icon(
                              Iconsax.arrow_right_3,
                              color: onBackgroundColor(context: context)
                                  .withOpacity(0.5),
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: List.generate(
                    animeModel!.length,
                    (index) => Padding(
                      padding: kTopPadding,
                      child: AnimeMovieCard(animeModel: animeModel[index]),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          error: (message) => Text(message),
        );
      },
    );
  }
}

class AnimeMovieCard extends StatelessWidget {
  final AnimeModel _animeModel;
  const AnimeMovieCard({
    super.key,
    required AnimeModel animeModel,
  }) : _animeModel = animeModel;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _animeModel.poster,
      imageBuilder: (context, imageProvider) => Row(
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
          Padding(
            padding: kLeftPadding,
            child: SizedBox(
              width: widthMediaQuery(context: context) * 0.6,
              height: heightMediaQuery(context: context) / 4.5,
              child: Column(
                mainAxisAlignment: kMainAxisAligmentStart(),
                crossAxisAlignment: kCrossAxisAlignmentStart(),
                children: [
                  Text(
                    _animeModel.title,
                    style: bodyLarge(context: context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    _animeModel.genre
                        .toString()
                        .replaceAll(']', '')
                        .replaceAll('[', ''),
                    style: bodySmall(context: context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: kMainAxisAligmentStart(),
                    crossAxisAlignment: kCrossAxisAlignmentStart(),
                    children: [
                      Text(
                        '${_animeModel.score}/10',
                        style: bodyMedium(context: context).copyWith(
                          color: kMainDarkTextColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: widthMediaQuery(context: context) * 0.5,
                    child: Text(
                      _animeModel.description!,
                      style: bodySmall(context: context),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () {
                      _goToDetail(
                          endpoint: _animeModel.endpoint, context: context);
                    },
                    child: Row(
                      mainAxisAlignment: kMainAxisAligmentCenter(),
                      children: [
                        Icon(
                          Iconsax.play,
                          color: onBackgroundColor(context: context),
                        ),
                        Text(
                          'Play',
                          style: bodyLarge(context: context),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

void _goToDetail({required String endpoint, required BuildContext context}) {
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

void _buildMore(BuildContext context) {
  MoreUseCase moreUseCase = MoreUseCase();
  moreUseCase(
    params: MoreUseCaseParams(
      context: context,
      status: 'Currently+Airing',
      order: 'latest',
      type: '',
      genre: '',
      page: 1,
    ),
  );
}
