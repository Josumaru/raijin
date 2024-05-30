import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:raijin/core/commons/widgets/anime_card_widget.dart';
import 'package:raijin/core/commons/widgets/loading_widget.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_category_bloc/anime_category_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_more_bloc/anime_more_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String selected = 'all';

    final RefreshController controller = RefreshController();

    context.read<AnimeMoreBloc>().add(const AnimeMoreEvent.animeResetMore());
    context.read<AnimeMoreBloc>().add(
          const AnimeMoreEvent.animeGetMore(
            status: '',
            order: '',
            type: '',
            genre: '',
            page: 0,
          ),
        );
    initial(BuildContext context) {
      return Shimmer.fromColors(
        baseColor: onBackgroundColor(context: context).withOpacity(0.1),
        highlightColor: onBackgroundColor(context: context).withOpacity(0.3),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              4,
              (index) => Padding(
                padding: kTopPadding,
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: index == 0 ? kHorizontalPadding : kRightPadding,
                      child: Column(
                        children: [
                          Container(
                            width: (widthMediaQuery(context: context) / 3) -
                                (40 / 3),
                            height:
                                heightMediaQuery(context: context) / 4.5 + 40,
                            decoration: BoxDecoration(
                              borderRadius: kMainBorderRadius,
                              color: backgroundColor(context: context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    pullUp({required BuildContext context, required int page}) async {
      context.read<AnimeMoreBloc>().add(
            AnimeMoreEvent.animeGetMore(
              status: '',
              order: '',
              type: '',
              genre: selected == 'all' ? '' : selected,
              page: 0,
            ),
          );
      await Future.delayed(const Duration(seconds: 2), () {
        controller.loadComplete();
      });
    }

    loaded({
      required List<AnimeModel> animeModel,
      required BuildContext context,
      required int page,
    }) {
      int length = (animeModel.length / 3).ceil();
      int index = 0;
      return SmartRefresher(
        controller: controller,
        enablePullUp: true,
        enablePullDown: false,
        onLoading: () async {
          pullUp(context: context, page: (animeModel.length / 30).round());
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                        if (index == animeModel.length) {
                          return Container();
                        }
                        return Padding(
                          padding: j == 0 ? kHorizontalPadding : kRightPadding,
                          child: AnimeCardWidget(
                            animeModel: animeModel[index++],
                            removeTitle: false,
                          ),
                        );
                      },
                    ).animate(delay: 0.55.seconds).slideY(begin: 1),
                  ),
                );
              },
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AnimeCategoryBloc, AnimeCategoryState>(
          builder: (context, state) {
            if (state.loading) {
              return const LoadingWidget();
            } else {
              List<String> genreList = state.genreList.toList();
              genreList.insert(0, 'all');
              return Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: BlocBuilder<AnimeMoreBloc, AnimeMoreState>(
                        builder: (context, state) {
                          if (state.error) {
                            return Center(
                              child: Text(
                                'Something Wrong',
                                style: bodySmall(context: context),
                              ),
                            );
                          } else if (state.animeList.isEmpty) {
                            return initial(context);
                          }

                          return loaded(
                            animeModel: state.animeList,
                            context: context,
                            page: state.page,
                          );
                        },
                      ),
                    ),
                  ),
                  // const Spacer(),
                  SizedBox(
                    width: widthMediaQuery(context: context),
                    child: Padding(
                      padding: kHorizontalPadding,
                      child: ElevatedButton(
                          onPressed: () {
                            WoltModalSheet.show(
                              context: context,
                              pageListBuilder: (context) {
                                return [
                                  SliverWoltModalSheetPage(
                                    backgroundColor: backgroundColor(
                                      context: context,
                                    ),
                                    surfaceTintColor: onBackgroundColor(
                                      context: context,
                                    ),
                                    mainContentSlivers: [
                                      SliverPadding(
                                        padding: kMainPadding * 2,
                                        sliver: SliverGrid(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 3,
                                          ),
                                          delegate: SliverChildListDelegate(
                                            List.generate(
                                              genreList.length,
                                              (index) => InkWell(
                                                onTap: () {
                                                  selected = genreList[index];
                                                  context.read<AnimeMoreBloc>()
                                                    ..add(const AnimeMoreEvent
                                                        .animeResetMore())
                                                    ..add(
                                                      AnimeMoreEvent
                                                          .animeGetMore(
                                                        status: '',
                                                        order: '',
                                                        type: '',
                                                        genre: selected == 'all'
                                                            ? ''
                                                            : selected,
                                                        page: 0,
                                                      ),
                                                    );
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  margin: kAllPadding / 4,
                                                  width: 20,
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        kMainBorderRadius / 4,
                                                    color: genreList[index] ==
                                                            selected
                                                        ? primaryColor(
                                                            context: context,
                                                          )
                                                        : onBackgroundColor(
                                                            context: context,
                                                          ).withOpacity(
                                                            0.1,
                                                          ),
                                                  ),
                                                  child: Padding(
                                                    padding: kHorizontalPadding,
                                                    child: Text(
                                                      genreList[index]
                                                          .replaceAll('-', ' ')
                                                          .toUpperCase(),
                                                      style: bodySmall(
                                                        context: context,
                                                      ).copyWith(
                                                          color: genreList[
                                                                      index] ==
                                                                  selected
                                                              ? onBackgroundColor(
                                                                  context:
                                                                      context)
                                                              : onBackgroundColor(
                                                                      context:
                                                                          context)
                                                                  .withOpacity(
                                                                  0.5,
                                                                )),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ];
                              },
                            );
                          },
                          child: const Text('Show All Category')),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
