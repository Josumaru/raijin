import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:raijin/core/commons/widgets/anime_card_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/core/usecases/more_usecase/more_use_case.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_search_bloc/anime_search_bloc.dart';

class DiscoverWidget extends StatelessWidget {
  DiscoverWidget({super.key});
  final TextEditingController _controller = TextEditingController();
  final Debounce debounce = Debounce(millisecond: 800);
  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categoryList = [
      CategoryModel(title: 'Romance', icon: Iconsax.lovely),
      CategoryModel(title: 'School', icon: Iconsax.building),
      CategoryModel(title: 'Game', icon: Iconsax.game),
      CategoryModel(title: 'Music', icon: Iconsax.music),
      CategoryModel(title: 'Detective', icon: Iconsax.search_normal),
      CategoryModel(title: 'Recomendation', icon: Iconsax.category),
    ];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: kMainAxisAligmentStart(),
            crossAxisAlignment: kCrossAxisAlignmentStart(),
            children: [
              Padding(
                padding: kVerticalPadding,
                child: Row(
                  mainAxisAlignment: kMainAxisAligmentCenter(),
                  crossAxisAlignment: kCrossAxisAlignmentCenter(),
                  children: [
                    SizedBox(
                      width: widthMediaQuery(context: context) - 20,
                      child: TextFormField(
                        controller: _controller,
                        autocorrect: true,
                        onChanged: (value) {
                          _search(
                            context: context,
                            value: value,
                            quick: false,
                          );
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: kHorizontalPadding,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: onBackgroundColor(
                            context: context,
                          )),
                          prefixIcon: const Icon(Iconsax.search_normal_14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Seeking an',
                      style: bodyMedium(context: context).copyWith(
                        fontSize: 50,
                        color: onBackgroundColor(context: context)
                            .withOpacity(0.9),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Adventure?',
                      style: bodyMedium(context: context).copyWith(
                        fontSize: 50,
                        color: onBackgroundColor(context: context)
                            .withOpacity(0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  'Treat yourself to the ultimate anime experience—all in one app. Explore over 1000 captivating anime titles, all available on samehadaku.care.',
                  style: bodySmall(context: context),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: kLeftPadding,
                child: Text(
                  'Categories',
                  style: bodyLarge(context: context),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: kHorizontalPadding,
                child: Container(
                  width: widthMediaQuery(context: context),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: onBackgroundColor(context: context).withOpacity(
                        0.3,
                      ),
                    ),
                    borderRadius: kMainBorderRadius,
                    color:
                        onBackgroundColor(context: context).withOpacity(0.05),
                  ),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: kVerticalPadding,
                          child: Row(
                            children: List.generate(
                              categoryList.length,
                              (index) => Padding(
                                padding: index < 3
                                    ? kLeftPadding
                                    : kHorizontalPadding,
                                child: CategoryCard(
                                    title: categoryList[index]._title,
                                    icon: categoryList[index]._icon),
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See more category'),
                      )
                    ],
                  ),
                ),
              ),
              BlocBuilder<AnimeSearchBloc, AnimeSearchState>(
                builder: (context, state) => state.when(
                  initial: () => Container(),
                  loading: () => Padding(
                    padding: kAllPadding,
                    child: Center(
                      child: LoadingAnimationWidget.stretchedDots(
                        color: primaryColor(context: context),
                        size: 32,
                      ),
                    ),
                  ),
                  loaded: (animeModel) => _loaded(animeModel),
                  error: (message) => Padding(
                    padding: kMainPadding,
                    child: const Text('Something wrong'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _search({
    required BuildContext context,
    required String value,
    required bool quick,
  }) {
    if (value.isNotEmpty && value.trim() != '') {
      quick
          ? context
              .read<AnimeSearchBloc>()
              .add(AnimeSearchEvent.animeSearchEvent(query: value))
          : debounce.run(
              () {
                context
                    .read<AnimeSearchBloc>()
                    .add(AnimeSearchEvent.animeSearchEvent(query: value));
              },
            );
    }
  }

  _loaded(List<AnimeModel> animeModel) {
    int length = (animeModel.length / 3).ceil();
    int index = 0;
    if (animeModel.isEmpty) {
      return Padding(
        padding: kMainPadding,
        child: const Center(child: Text('Not Found')),
      );
    }
    return Padding(
      padding: kTopPadding,
      child: Column(
        children: List.generate(
          length,
          (i) {
            return Padding(
              padding: kTopPadding,
              child: Row(
                children: List.generate(
                  3,
                  (j) {
                    return Padding(
                      padding: j == 0 ? kHorizontalPadding : kRightPadding,
                      child: () {
                        if (index == animeModel.length) {
                          return Container();
                        }
                        return AnimeCardWidget(
                          animeModel: animeModel[index++],
                          removeTitle: false,
                        );
                      }(),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Debounce {
  final int _millisecond;
  Timer? _timer;

  Debounce({required int millisecond}) : _millisecond = millisecond;

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: _millisecond), action);
  }
}

_buildMore({required BuildContext context, required String genre}) {
  MoreUseCase moreUseCase = MoreUseCase();
  moreUseCase(
    params: MoreUseCaseParams(
      context: context,
      status: '',
      order: 'latest',
      type: '',
      genre: genre,
      page: 1,
    ),
  );
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required String title, required IconData icon})
      : _title = title,
        _icon = icon;
  final String _title;
  final IconData _icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: kMainBorderRadius,
      onTap: () {
        _buildMore(context: context, genre: _title);
      },
      child: Container(
        padding: kVerticalPadding,
        width: (widthMediaQuery(context: context) / 4) - 70 / 4,
        decoration: BoxDecoration(
          color: backgroundColor(context: context),
          border: Border.all(
            color: onBackgroundColor(context: context).withOpacity(
              0.3,
            ),
          ),
          borderRadius: kMainBorderRadius,
        ),
        child: Column(
          children: [
            Icon(
              _icon,
              color: onBackgroundColor(context: context),
              size: 16,
            ),
            Text(
              _title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

class CategoryModel {
  final String _title;
  final IconData _icon;

  CategoryModel({
    required String title,
    required IconData icon,
  })  : _title = title,
        _icon = icon;
}
