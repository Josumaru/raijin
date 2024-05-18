part of 'anime_video_bloc.dart';

@freezed
class AnimeVideoEvent with _$AnimeVideoEvent {
  const factory AnimeVideoEvent.getVideo({required String endpoint, required String baseUrl}) = _GetVideo;

  // const factory AnimeVideoEvent.showControll({required bool showControl}) =
  //     _ShowControl;
  // const factory AnimeVideoEvent.seekPosition({required double position}) =
  //     _SeekPosition;
  // const factory AnimeVideoEvent.setControllStatus({String? quality, double? playbackSpeed}) =
  //     _SetControllStatus;
  // const factory AnimeVideoEvent.changeEpisode({required String endpoint}) =
  //     _ChangeEpisode;
  // const factory AnimeVideoEvent.setBuffering({required bool buffering}) =
  //     _SetBuffering;
  // const factory AnimeVideoEvent.playVideo({
  //   required bool isPlay,
  // }) = _PlayVideo;
  // const factory AnimeVideoEvent.addHistory({
  //   required VideoModel video,
  // }) = _AddHistory;
  // const factory AnimeVideoEvent.setPosition({
  //   required int position,
  //   required int duration,
  // }) = _SetPosition;
}
