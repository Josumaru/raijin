import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/commons/widgets/anime_card_shimmer_widget.dart';
import 'package:raijin/core/commons/widgets/anime_card_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/usecases/more_usecase/more_use_case.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_complete_bloc/anime_complete_bloc.dart';

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
          error: (message) => const SizedBox(),
        );
      },
    );
  }

  _buildLoading() => const AnimeCardShimmerWidget();
  _buildMore(BuildContext context) {
    MoreUseCase moreUseCase = MoreUseCase();
    moreUseCase(
      params: MoreUseCaseParams(
        context: context,
        status: 'Finished+Airing',
        order: 'latest',
        type: '',
        genre: '',
        page: 1,
      ),
    );
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
                'Finished Airing Anime',
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
            ).animate(interval: .35.seconds).slideX(begin: 1),
          ),
        ),
      ],
    );
  }
}
