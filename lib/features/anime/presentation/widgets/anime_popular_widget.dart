import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raijin/core/commons/widgets/anime_card_shimmer_widget.dart';
import 'package:raijin/core/commons/widgets/anime_card_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_popular_bloc/anime_popular_bloc.dart';

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
          padding: kLeftPadding,
          child: Text(
            'Top 10 Anime',
            style: headlineLarge(context: context).copyWith(
              color: onBackgroundColor(context: context),
            ),
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
