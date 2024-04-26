part of 'anime_video_bloc.dart';

@freezed
class AnimeVideoEvent with _$AnimeVideoEvent {
  const factory AnimeVideoEvent.animeGetVideo({required String endpoint}) = _AnimeGetVideo;
  const factory AnimeVideoEvent.showControl({required bool control}) = _ShowControl;
  const factory AnimeVideoEvent.seekPosition({required int position}) = _SeekPosition;
  const factory AnimeVideoEvent.changeResolution({required String mirror}) = _ChangeResolution;
}