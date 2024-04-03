part of 'anime_complete_bloc.dart';

@freezed
class AnimeCompleteState with _$AnimeCompleteState {
  const factory AnimeCompleteState.initial() = _Initial;
  const factory AnimeCompleteState.loading() = _Loading;
  const factory AnimeCompleteState.loaded({List<AnimeModel>? animeModel}) = _Loaded;
  const factory AnimeCompleteState.error({required String message}) = _Error;
}
