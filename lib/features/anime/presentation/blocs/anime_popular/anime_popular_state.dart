part of 'anime_popular_bloc.dart';

@freezed
class AnimePopularState with _$AnimePopularState {
  const factory AnimePopularState.initial() = _Initial;
  const factory AnimePopularState.loading() = _Loading;
  const factory AnimePopularState.loaded({List<AnimeModel>? animeModel}) = _Loaded;
  const factory AnimePopularState.error({required String message}) = _Error;
}
