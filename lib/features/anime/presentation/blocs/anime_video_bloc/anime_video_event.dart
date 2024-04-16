part of 'anime_video_bloc.dart';

@freezed
class AnimeVideoEvent with _$AnimeVideoEvent {
  const factory AnimeVideoEvent.animeGetVideo({required String endpoint}) = _AnimeGetVideo;
}