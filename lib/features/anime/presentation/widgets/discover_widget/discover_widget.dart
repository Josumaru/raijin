import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:raijin/core/commons/widgets/anime_card_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_search_bloc/anime_search_bloc.dart';
import 'package:raijin/features/anime/presentation/widgets/video_widgets/video_widget.dart';

class DiscoverWidget extends StatelessWidget {
  DiscoverWidget({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: kVerticalPadding,
                child: Row(
                  mainAxisAlignment: kMainAxisAligmentCenter(),
                  crossAxisAlignment: kCrossAxisAlignmentCenter(),
                  children: [
                    // Icon(
                    //   Iconsax.arrow_left_2,
                    //   color: onBackgroundColor(context: context),
                    // ),
                    SizedBox(
                      width: widthMediaQuery(context: context) - 20,
                      child: TextFormField(
                        controller: _controller,
                        autocorrect: true,
                        onChanged: (value) {
                          context.read<AnimeSearchBloc>().add(
                              AnimeSearchEvent.animeSearchEvent(query: value));
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: kHorizontalPadding,
                          hintText: 'Search',
                          prefixIcon: const Icon(Iconsax.search_normal_14),
                        ),
                      ),
                    ),
                    // Icon(
                    //   Iconsax.filter_search,
                    //   color: onBackgroundColor(context: context),
                    // ),
                  ],
                ),
              ),
              BlocBuilder<AnimeSearchBloc, AnimeSearchState>(
                builder: (context, state) => state.when(
                  initial: () => Container(),
                  loading: () => Container(),
                  loaded: (animeModel) => _loaded(animeModel),
                  error: (message) => Padding(
                    padding: kMainPadding,
                    child: const Text('Something wrong!'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _loaded(List<AnimeModel> animeModel) {
    int length = (animeModel.length / 3).round();
    int index = 0;
    return Column(
      children: List.generate(
        length,
        (i) {
          return Row(
            children: List.generate(
              3,
              (j) {
                if (index == animeModel.length - 1) {
                  return Container();
                }
                return Padding(
                  padding: j == 0 ? kHorizontalPadding : kRightPadding,
                  child: AnimeCardWidget(
                    animeModel: animeModel[
                        index < animeModel.length - 1 ? index++ : index],
                    removeTitle: false,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
