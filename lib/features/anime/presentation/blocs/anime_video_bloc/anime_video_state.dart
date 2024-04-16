part of 'anime_video_bloc.dart';

@freezed
class AnimeVideoState with _$AnimeVideoState {
  const factory AnimeVideoState.initial() = _Initial;
  const factory AnimeVideoState.loading() = _Loading;
  const factory AnimeVideoState.loaded({required List<VideoModel> videoModel}) = _Loaded;
  const factory AnimeVideoState.error({required String message}) = _Error;
}
