import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:raijin/core/commons/widgets/anime_card_shimmer_widget.dart';
import 'package:raijin/core/commons/widgets/anime_card_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_more_bloc/anime_more_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_popular_bloc/anime_popular_bloc.dart';
import 'package:raijin/features/anime/presentation/pages/more_page.dart';

class AnimePopularWidget extends StatelessWidget {
  const AnimePopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimePopularBloc, AnimePopularState>(
      builder: (context, state) {
        return state.when(
          initial: () => _buildLoading(context),
          loading: () => _buildLoading(context),
          loaded: (animeModel) => _buildLoaded(context, animeModel),
          error: (message) => const Text('Unable to Load'),
        );
      },
    );
  }

  _buildLoading(BuildContext context) {
    return const AnimeCardShimmerWidget();
  }

  Column _buildLoaded(BuildContext context, List<AnimeModel>? animeModel) {
    return Column(
      mainAxisAlignment: kMainAxisAligmentStart(),
      crossAxisAlignment: kCrossAxisAlignmentStart(),
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: kHorizontalPadding,
          child: Row(
            crossAxisAlignment: kCrossAxisAlignmentCenter(),
            children: [
              Text(
                'Top 10 Anime',
                style: headlineLarge(context: context).copyWith(
                  color: onBackgroundColor(context: context),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  context.read<AnimeMoreBloc>().add(
                        const AnimeMoreEvent.animeGetMore(
                          status: '',
                          order: 'popular',
                          type: '',
                          page: 1,
                        ),
                      );
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    screen: const MorePage(),
                    settings: const RouteSettings(name: '/more'),
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Row(
                  children: [
                    const Text('View All'),
                    Icon(
                      Iconsax.arrow_right_3,
                      color: onBackgroundColor(context: context),
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => Padding(
                padding: index == 0 ? kHorizontalPadding : kRightPadding,
                child: AnimeCardWidget(
                  index: index + 1,
                  animeModel: animeModel![index],
                  removeTitle: false,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
