part of 'anime_movie_bloc.dart';

@freezed
class AnimeMovieEvent with _$AnimeMovieEvent {
  const factory AnimeMovieEvent.animeGetMovie({
    required String status,
    required String order,
    required String type,
    required String genre,
    required int page,
  }) = _AnimeGetMovie;
}