part of 'anime_ongoing_bloc.dart';

@freezed
class AnimeOngoingState with _$AnimeOngoingState {
  const factory AnimeOngoingState.initial() = _Initial;
  const factory AnimeOngoingState.loading() = _Loading;
  const factory AnimeOngoingState.loaded({List<AnimeModel>? animeModel}) = _Loaded;
  const factory AnimeOngoingState.error({required String message}) = _Error;
}
