part of 'anime_video_bloc.dart';

@freezed
class AnimeVideoState with _$AnimeVideoState {
  const AnimeVideoState._();
  const factory AnimeVideoState({
    required bool isLoading,
    required bool isBuffering,
    required bool isShowControll,
    required bool isPlaying,
    required bool isBackward,
    required bool isForward,
    required int videoDuration,
    required int videoPosition,
    required int sliderPosition,
    required List<VideoModel> videoList,
    required List<EpisodeModel> episodeList,
    // required Option<Either<Failure<String>, List<VideoModel>>> videoList,
    // required Option<Either<Failure<String>, List<EpisodeModel>>> episodeList,
  }) = _AnimeVideoState;

  factory AnimeVideoState.started() => const AnimeVideoState(
        isLoading: false,
        videoDuration: 0,
        videoPosition: 0,
        videoList: [],
        episodeList: [],
        isBuffering: false,
        isBackward: false,
        isForward: false,
        isPlaying: false,
        isShowControll: false,
        sliderPosition: 0,
      );
}
