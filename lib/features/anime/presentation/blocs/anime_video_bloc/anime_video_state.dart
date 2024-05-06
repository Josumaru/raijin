part of 'anime_video_bloc.dart';

@freezed
class AnimeVideoState with _$AnimeVideoState {
  const AnimeVideoState._();
  const factory AnimeVideoState({
    required String mirror,
    required String quality,
    required String endpoint,
    required bool initialize,
    required bool error,
    required bool loading,
    required bool buffering,
    required bool showControll,
    required bool playing,
    required bool backward,
    required bool forward,
    required double playbackSpeed,
    required int videoDuration,
    required int videoPosition,
    required double sliderPosition,
    required List<VideoModel> videoList,
    required List<EpisodeModel> episodeList,
    // required Option<Either<Failure<String>, List<VideoModel>>> videoList,
    // required Option<Either<Failure<String>, List<EpisodeModel>>> episodeList,
  }) = _AnimeVideoState;

  factory AnimeVideoState.started() {
    return const AnimeVideoState(
      initialize: false,
      error: false,
      mirror: '',
      loading: false,
      videoDuration: 0,
      videoPosition: 0,
      videoList: [],
      episodeList: [],
      buffering: false,
      backward: false,
      forward: false,
      playing: false,
      sliderPosition: 0,
      showControll: false,
      quality: '',
      endpoint: '',
      playbackSpeed: 1,
    );
  }
}
