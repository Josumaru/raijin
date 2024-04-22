part of 'anime_more_bloc.dart';

@freezed
class AnimeMoreState with _$AnimeMoreState {
  const factory AnimeMoreState.initial() = _Initial;
  const factory AnimeMoreState.loading() = _Loading;
  const factory AnimeMoreState.loaded({List<AnimeModel>? animeModel}) = _Loaded;
  const factory AnimeMoreState.error({required String message}) = _Error;
}
