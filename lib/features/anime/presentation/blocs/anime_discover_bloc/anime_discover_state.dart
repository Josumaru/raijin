part of 'anime_discover_bloc.dart';

@freezed
class AnimeDiscoverState with _$AnimeDiscoverState {
  const factory AnimeDiscoverState.initial() = _Initial;
  const factory AnimeDiscoverState.loading() = _Loading;
  const factory AnimeDiscoverState.loaded({
    required List<AnimeModel> animeModel,
  }) = _Loaded;
  const factory AnimeDiscoverState.error({required String message}) = _Error;
}
