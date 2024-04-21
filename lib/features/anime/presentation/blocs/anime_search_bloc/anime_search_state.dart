part of 'anime_search_bloc.dart';

@freezed
class AnimeSearchState with _$AnimeSearchState {
  const factory AnimeSearchState.initial() = _Initial;
  const factory AnimeSearchState.loading() = _Loading;
  const factory AnimeSearchState.loaded({required List<AnimeModel> animeModel}) = _Loaded;
  const factory AnimeSearchState.error({required String message}) = _Error;
}
