import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:raijin/core/commons/widgets/exit_widget.dart';
import 'package:raijin/core/constants/alignment.dart';
import 'package:raijin/features/anime/presentation/widgets/anime_complete_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/anime_ongoing_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/anime_popular_widget.dart';
import 'package:raijin/features/anime/presentation/widgets/carousel_widget.dart';

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
          header: const WaterDropHeader(),
          onRefresh: _refresh,
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
                  // const HomeProfileWidget(),
                  // const SearchBarWidget(),
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

  void _refresh() async {
    await Future.delayed(const Duration(seconds: 1), () {
      _refreshController.refreshCompleted();
    });
  }
}
