import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:raijin/core/usecases/use_case.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_more_bloc/anime_more_bloc.dart';
import 'package:raijin/features/anime/presentation/pages/more_page.dart';

class MoreUseCase extends UseCase<void, MoreUseCaseParams> {
  @override
  Future<void> call({required MoreUseCaseParams? params}) async {
    params?.context.read<AnimeMoreBloc>().add(
          AnimeMoreEvent.animeGetMore(
            status: params.status,
            order: params.order,
            type: params.type,
            page: params.page,
          ),
        );
    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
      params!.context,
      screen: MorePage(
        moreUseCaseParams: params,
      ),
      settings: const RouteSettings(name: '/more'),
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}

class MoreUseCaseParams {
  final BuildContext context;
  final String status;
  final String order;
  final String type;
  final int page;
  MoreUseCaseParams({
    required this.context,
    required this.status,
    required this.order,
    required this.type,
    required this.page,
  });
}
