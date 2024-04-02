import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_ongoing_bloc/anime_ongoing_bloc.dart';
import 'package:raijin/features/anime/presentation/widgets/anime_popular_card_widget.dart';

class AnimeOngoingWidget extends StatelessWidget {
  const AnimeOngoingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeOngoingBloc, AnimeOngoingState>(
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => Container(),
          loaded: (animeModel) {
            return Column(
              mainAxisAlignment: kMainAxisAligmentStart(),
              crossAxisAlignment: kCrossAxisAlignmentStart(),
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: kLeftPadding,
                  child: Text(
                    'Airing Anime',
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
                        padding:
                            index == 0 ? kHorizontalPadding : kRightPadding,
                        child: AnimePopularCardWidget(
                          animeModel: animeModel[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (message) => Text(message),
        );
      },
    );
  }
}
