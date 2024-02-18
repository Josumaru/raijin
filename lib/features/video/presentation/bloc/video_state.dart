part of 'video_bloc.dart';

sealed class VideoState extends Equatable {
  const VideoState({required this.videoEntity});
  final List<VideoEntity> videoEntity;

  @override
  List<Object> get props => [
        videoEntity
      ];
}

final class VideoInitial extends VideoState {
  const VideoInitial({required super.videoEntity});
}

final class VideoLoading extends VideoState {
  const VideoLoading({required super.videoEntity});
}

final class VideoLoaded extends VideoState {
  const VideoLoaded({required super.videoEntity});
}

final class VideoFailed extends VideoState {
  const VideoFailed({required super.videoEntity});
}
