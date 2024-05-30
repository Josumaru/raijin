import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:raijin/core/commons/widgets/anime_card_widget.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/core/constants/sizes.dart';
import 'package:raijin/core/usecases/more_usecase/more_use_case.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_more_bloc/anime_more_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MoreWidget extends StatelessWidget {
  MoreWidget({
    super.key,
    required MoreUseCaseParams moreUseCaseParams,
  }) : _moreUseCaseParams = moreUseCaseParams;
  final RefreshController _controller = RefreshController();
  final MoreUseCaseParams _moreUseCaseParams;

  @override
  Widget build(BuildContext context) {
    context.read<AnimeMoreBloc>().add(const AnimeMoreEvent.animeResetMore());
    _pullUp(context: context, page: 0);
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AnimeMoreBloc, AnimeMoreState>(
          builder: (context, state) {
            if (state.error) {
              return Center(
                child: Text(
                  'Something Wrong',
                  style: bodySmall(context: context),
                ),
              );
            } else if (state.animeList.isEmpty) {
              return _initial(context);
            }

            return _loaded(
              animeModel: state.animeList,
              context: context,
              page: state.page,
            );
          },
        ),
      ),
    );
  }

  _initial(BuildContext context) {
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
                        width:
                            (widthMediaQuery(context: context) / 3) - (40 / 3),
                        height: heightMediaQuery(context: context) / 4.5 + 40,
                        decoration: BoxDecoration(
                          borderRadius: kMainBorderRadius,
                          color: backgroundColor(context: context),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }

  _pullUp({required BuildContext context, required int page}) async {
    _moreUseCaseParams.context.read<AnimeMoreBloc>().add(
          AnimeMoreEvent.animeGetMore(
            status: _moreUseCaseParams.status,
            order: _moreUseCaseParams.order,
            type: _moreUseCaseParams.type,
            genre: _moreUseCaseParams.genre,
            page: page,
          ),
        );
    await Future.delayed(const Duration(seconds: 2), () {
      _controller.loadComplete();
    });
  }

  _loaded({
    required List<AnimeModel> animeModel,
    required BuildContext context,
    required int page,
  }) {
    int length = (animeModel.length / 3).ceil();
    int index = 0;
    return SmartRefresher(
      controller: _controller,
      enablePullUp: true,
      enablePullDown: false,
      onLoading: () async {
        _pullUp(context: context, page: (animeModel.length / 30).round());
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
                  )
                      .animate(delay: 0.15.seconds, interval: 0.095.seconds)
                      .slideY(begin: 1),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
