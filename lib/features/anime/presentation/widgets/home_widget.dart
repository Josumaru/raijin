import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raijin/core/commons/widgets/exit_widget.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_new/anime_bloc.dart';
import 'package:raijin/features/anime/presentation/widgets/anime_popular_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/carousel_shimmer_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/carousel_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/home_profile_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/search_bar_wdiget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PopScope(
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
              children: [
                const HomeProfileWidget(),
                const SearchBarWidget(),
                BlocBuilder<AnimeBloc, AnimeState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => Container(),
                      loading: () => const CarouselShimmerWidget(),
                      loaded: (animeModel) {
                        return CarouselWidget(animeModel: animeModel!);
                      },
                      error: (message) => Text(message),
                    );
                  },
                ),
                const AnimePopularWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
