import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:raijin/core/commons/widgets/anime_card_shimmer_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/usecases/more_usecase/more_use_case.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_complete_bloc/anime_complete_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_new_bloc/anime_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_ongoing_bloc/anime_ongoing_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_popular_bloc/anime_popular_bloc.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/anime_complete_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/anime_movie_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/anime_ongoing_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/anime_popular_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/carousel_widget.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});
  final RefreshController _controller = RefreshController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SmartRefresher(
          enablePullDown: true,
          controller: _controller,
          header: ClassicHeader(
            idleIcon: Icon(
              Iconsax.direct_down,
              color: onBackgroundColor(context: context),
            ),
            releaseIcon: Icon(
              Iconsax.refresh,
              color: onBackgroundColor(context: context),
            ),
          ),
          onRefresh: () async {
            _refresh(context);
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: kMainAxisAligmentStart(),
              children: const [
                CarouselWidget(),
                AnimePopularWidget(),
                AnimeOngoingWidget(),
                AnimeCompleteWidget(),
                AnimeMovieWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _refresh(BuildContext context) async {
    context.read<AnimeBloc>().add(const AnimeEvent.animeGetNew(page: 1));
    context
        .read<AnimePopularBloc>()
        .add(const AnimePopularEvent.animeGetPopular(
          status: '',
          order: 'popular',
          type: '',
          genre: '',
          page: 1,
        ));
    context
        .read<AnimeOngoingBloc>()
        .add(const AnimeOngoingEvent.animeGetOngoing(
          status: 'Currently+Airing',
          order: 'latest',
          type: '',
          genre: '',
          page: 1,
        ));
    context
        .read<AnimeCompleteBloc>()
        .add(const AnimeCompleteEvent.animeGetComplete(
          status: 'Finished+Airing',
          order: 'latest',
          type: '',
          genre: '',
          page: 1,
        ));
    await Future.delayed(const Duration(seconds: 2), () {
      _controller.refreshCompleted();
    });
  }
}
