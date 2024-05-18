part of 'anime_bookmark_bloc.dart';

@freezed
class AnimeBookmarkState with _$AnimeBookmarkState {
  const AnimeBookmarkState._();
  const factory AnimeBookmarkState({
    required bool loading,
    required bool error,
    required List<AnimeModel> animeList,
  }) = _AnimeBookmarkState;
  // const factory AnimeBookmarkState.initial() = _Initial;
  factory AnimeBookmarkState.started() {
    return const AnimeBookmarkState(
      loading: false,
      error: false,
      animeList: [],
    );
  }
}
