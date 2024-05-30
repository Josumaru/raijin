// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_movie_use_case.dart';

part 'anime_movie_event.dart';
part 'anime_movie_state.dart';
part 'anime_movie_bloc.freezed.dart';

class AnimeMovieBloc extends Bloc<AnimeMovieEvent, AnimeMovieState> {
  final AnimeGetMovieUseCase _animeGetMovieUseCase;
  AnimeMovieBloc({required AnimeGetMovieUseCase animeGetMovieUseCase})
      : _animeGetMovieUseCase = animeGetMovieUseCase,
        super(const AnimeMovieState.initial()) {
    on<AnimeMovieEvent>(
      (event, emit) {
        event.when(
          animeGetMovie: (status, order, type, genre, page) => _animeGetMovie(
            status: status,
            order: order,
            type: type,
            genre: genre,
            page: page,
          ),
        );
      },
    );
  }
  Future _animeGetMovie({
    required String status,
    required String order,
    required String type,
    required String genre,
    required int page,
  }) async {
    emit(const AnimeMovieState.loading());
    final data = await _animeGetMovieUseCase(
      genre: genre,
      status: status,
      order: order,
      type: type,
      page: page,
    );
    data.fold(
      (l) => emit(AnimeMovieState.error(message: l.messages)),
      (r) => emit(
        AnimeMovieState.loaded(animeModel: r),
      ),
    );
  }
}
