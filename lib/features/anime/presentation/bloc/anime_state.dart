part of 'anime_bloc.dart';

@freezed
class AnimeState with _$AnimeState {
  const factory AnimeState.initial() = _Initial;
  const factory AnimeState.loading() = _Loading;
  const factory AnimeState.loaded() = _Loaded;
  const factory AnimeState.error() = _Error;
}
