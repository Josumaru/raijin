part of 'anime_more_bloc.dart';

@freezed
class AnimeMoreState with _$AnimeMoreState {
  const AnimeMoreState._();
  const factory AnimeMoreState({
    required bool loading,
    required bool error,
    required int page,
    required List<AnimeModel> animeList,
  }) = _AnimeMoreState;

  factory AnimeMoreState.started() {
    return const AnimeMoreState(
      animeList: [],
      loading: false,
      error: false,
      page: 0,
    );
  }
}
