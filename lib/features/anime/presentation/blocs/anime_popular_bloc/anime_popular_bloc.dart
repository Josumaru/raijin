// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_use_case.dart';

part 'anime_popular_event.dart';
part 'anime_popular_state.dart';
part 'anime_popular_bloc.freezed.dart';

class AnimePopularBloc extends Bloc<AnimePopularEvent, AnimePopularState> {
  AnimeGetUseCase animeGetUseCase;
  AnimePopularBloc({required this.animeGetUseCase})
      : super(const AnimePopularState.initial()) {
    on<AnimePopularEvent>((event, emit) async {
      event.when(
        animeGetPopular: (status, order, type, genre, page) => _animeGetPopular(
          status: status,
          order: order,
          type: type,
          genre: genre,
          page: page,
        ),
      );
    });
  }
  Future _animeGetPopular({
    required String status,
    required String order,
    required String type,
    required String genre,
    required int page,
  }) async {
    emit(const AnimePopularState.loading());
    final data = await animeGetUseCase(
      order: order,
      status: status,
      type: type,
      genre: genre,
      page: page,
    );
    data.fold(
      (l) => emit(AnimePopularState.error(message: l.toString())),
      (r) => emit(AnimePopularState.loaded(animeModel: r)),
    );
  }
}
