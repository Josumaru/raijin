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
import 'package:raijin/features/anime/presentation/blocs/anime_ongoing_bloc/anime_ongoing_bloc.dart';

class AnimeOngoingWidget extends StatelessWidget {
  const AnimeOngoingWidget({super.key, String? title}) : _title = title;

  final String? _title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeOngoingBloc, AnimeOngoingState>(
      builder: (context, state) {
        List<AnimeModel> animeModel = state.animeModel;
        if (state.error) {
          return const SizedBox();
        } else if (state.loading) {
          return _buildLoading();
        } else {
          return _buildLoaded(context, animeModel);
        }
      },
    );
  }

  _buildLoading() => const AnimeCardShimmerWidget();
  _buildMore(BuildContext context) {
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
                _title ?? 'Airing Anime',
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
