import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:raijin/core/commons/widgets/anime_card_widget.dart';
import 'package:raijin/core/constants/padding.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_more_bloc/anime_more_bloc.dart';

class MoreWidget extends StatelessWidget {
  MoreWidget({super.key});
  final RefreshController _controller = RefreshController();

  @override
  Widget build(BuildContext context) {
    List<AnimeModel> animeModelList = [];
    int page = 1;
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AnimeMoreBloc, AnimeMoreState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Text('Init'),
              loading: () => const Text('Loading'),
              loaded: (animeModel) {
                for (int i = 0; i < animeModel!.length; i++) {
                  animeModelList.add(animeModel[i]);
                }

                return _loaded(animeModelList, context, page++);
              },
              error: (message) => Text(message),
            );
          },
        ),
      ),
    );
  }

  _loaded(List<AnimeModel>? animeModel, BuildContext context, int page) {
    int length = (animeModel!.length / 3).round();
    int index = 0;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SmartRefresher(
        controller: _controller,
        enablePullUp: true,
        enablePullDown: false,
        onLoading: () {
          context.read<AnimeMoreBloc>().add(
                AnimeMoreEvent.animeGetMore(
                  status: '',
                  order: 'popular',
                  type: '',
                  page: page,
                ),
              );
          _controller.loadComplete();
        },
        child: Column(
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
        ),
      ),
    );
  }
}
