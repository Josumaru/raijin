part of 'anime_history_bloc.dart';

@freezed
class AnimeHistoryState with _$AnimeHistoryState {
  const AnimeHistoryState._();
  const factory AnimeHistoryState({
    required bool error,
    required bool loading,
    required List<VideoModel> videoList,
  }) = _AnimeHistoryState;
  factory AnimeHistoryState.started() {
    return const AnimeHistoryState(
      error: false,
      loading: false,
      videoList: [],
    );
  }
}
