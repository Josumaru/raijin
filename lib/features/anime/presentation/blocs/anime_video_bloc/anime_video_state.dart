part of 'anime_video_bloc.dart';

@freezed
class AnimeVideoState with _$AnimeVideoState {
  const AnimeVideoState._();
  const factory AnimeVideoState({
    required bool error,
    required bool loading,
    required List<VideoModel> videoList,
  }) = _AnimeVideoState;

  factory AnimeVideoState.started() {
    return const AnimeVideoState(
      error: false,
      loading: false,
      videoList: [],
    );
  }
}
