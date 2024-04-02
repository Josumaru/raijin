// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_popular_use_case.dart';

part 'anime_popular_event.dart';
part 'anime_popular_state.dart';
part 'anime_popular_bloc.freezed.dart';

class AnimePopularBloc extends Bloc<AnimePopularEvent, AnimePopularState> {
  AnimeGetPopularUseCase animeGetPopularUseCase;
  AnimePopularBloc({required this.animeGetPopularUseCase})
      : super(const AnimePopularState.initial()) {
    on<AnimePopularEvent>((event, emit) async {
      await event.when(
        animeGetPopular: () async => await _animeGetPopular(),
      );
    });
  }
  Future _animeGetPopular() async {
    emit(const AnimePopularState.loading());
    final data = await animeGetPopularUseCase();
    data.fold(
      (l) => emit(AnimePopularState.error(message: l.toString())),
      (r) => emit(AnimePopularState.loaded(animeModel: r)),
    );
  }
}
