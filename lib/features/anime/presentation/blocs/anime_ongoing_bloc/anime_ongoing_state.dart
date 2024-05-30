part of 'anime_ongoing_bloc.dart';

@freezed
class AnimeOngoingState with _$AnimeOngoingState {
  const AnimeOngoingState._();
  const factory AnimeOngoingState({
    required bool loading,
    required bool error,
    required List<AnimeModel> animeModel,
  }) = _AnimeOngoingState;
  factory AnimeOngoingState.started() {
    return const AnimeOngoingState(
      loading: false,
      error: false,
      animeModel: [],
    );
  }
}
