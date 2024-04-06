import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raijin/core/commons/widgets/anime_card_shimmer_widget.dart';
import 'package:raijin/core/commons/widgets/anime_card_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_complete_bloc/anime_complete_bloc.dart';
import 'package:raijin/features/anime/presentation/widgets/anime_popular_card_widget.dart';

class AnimeCompleteWidget extends StatelessWidget {
  const AnimeCompleteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeCompleteBloc, AnimeCompleteState>(
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => _buildLoading(),
          loaded: (animeModel) {
            return _buildLoaded(context, animeModel);
          },
          error: (message) => Text(message),
        );
      },
    );
  }

  _buildLoading() => const AnimeCardShimmerWidget();

  Column _buildLoaded(BuildContext context, List<AnimeModel>? animeModel) {
    return Column(
      mainAxisAlignment: kMainAxisAligmentStart(),
      crossAxisAlignment: kCrossAxisAlignmentStart(),
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: kLeftPadding,
          child: Text(
            'Finished Airing Anime',
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
              animeModel!.length,
              (index) => Padding(
                padding: index == 0 ? kHorizontalPadding : kRightPadding,
                child: AnimeCardWidget(
                  animeModel: animeModel[index],
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
