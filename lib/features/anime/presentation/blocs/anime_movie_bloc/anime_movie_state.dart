part of 'anime_movie_bloc.dart';

@freezed
class AnimeMovieState with _$AnimeMovieState {
  const factory AnimeMovieState.initial() = _Initial;
  const factory AnimeMovieState.loading() = _Loading;
  const factory AnimeMovieState.loaded({List<AnimeModel>? animeModel}) = _Loaded;
  const factory AnimeMovieState.error({required String message}) = _Error;
}
