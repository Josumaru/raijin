part of 'anime_popular_bloc.dart';

@freezed
class AnimePopularEvent with _$AnimePopularEvent {
  const factory AnimePopularEvent.animeGetPopular({
    required String status,
    required String order,
    required String type,
    required int page,
  }) = _AnimeGetPopular;
}
