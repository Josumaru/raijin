import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:raijin/core/commons/widgets/exit_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_complete_bloc/anime_complete_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_new_bloc/anime_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_ongoing_bloc/anime_ongoing_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_popular_bloc/anime_popular_bloc.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/anime_complete_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/anime_ongoing_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/anime_popular_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/home_widgets/carousel_widget.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SmartRefresher(
          enablePullDown: true,
          controller: _refreshController,
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
          child: PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              showExitDialog(
                context: context,
                title: 'Exit',
                content: 'Are you sure to close the Application ?',
                onPressed: () {
                  exit(0);
                },
              );
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _refresh(BuildContext context) async {
    context.read<AnimeBloc>().add(const AnimeEvent.animeGetNew(page: 1));
    context.read<AnimePopularBloc>().add(
        const AnimePopularEvent.animeGetPopular(
            status: '', order: 'popular', type: ''));
    context
        .read<AnimeOngoingBloc>()
        .add(const AnimeOngoingEvent.animeGetOngoing(
          status: 'Currently+Airing',
          order: 'latest',
          type: '',
        ));
    context
        .read<AnimeCompleteBloc>()
        .add(const AnimeCompleteEvent.animeGetComplete(
          status: 'Finished+Airing',
          order: 'latest',
          type: '',
        ));
    await Future.delayed(const Duration(seconds: 2), () {
      _refreshController.refreshCompleted();
    });
  }
}
