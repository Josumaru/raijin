import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/commons/widgets/anime_card_shimmer_widget.dart';
import 'package:raijin/core/commons/widgets/anime_card_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_ongoing_bloc/anime_ongoing_bloc.dart';

class AnimeOngoingWidget extends StatelessWidget {
  const AnimeOngoingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeOngoingBloc, AnimeOngoingState>(
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => _buildLoading(),
          loaded: (animeModel) => _buildLoaded(context, animeModel),
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
          padding: kHorizontalPadding,
          child: Row(
            crossAxisAlignment: kCrossAxisAlignmentCenter(),
            children: [
              Text(
                'Airing Anime',
                style: headlineLarge(context: context).copyWith(
                  color: onBackgroundColor(context: context),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
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
