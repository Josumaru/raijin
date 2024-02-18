part of 'video_bloc.dart';

sealed class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class GetVideoEvent extends VideoEvent {
  final EpisodeEntity episodeEntity;
  const GetVideoEvent({required this.episodeEntity});
}
