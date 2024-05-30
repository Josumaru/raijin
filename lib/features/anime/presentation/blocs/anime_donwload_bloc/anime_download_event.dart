part of 'anime_download_bloc.dart';

@freezed
class AnimeDownloadEvent with _$AnimeDownloadEvent {
  const factory AnimeDownloadEvent.download({required DownloadParams params}) = _Download;
  const factory AnimeDownloadEvent.getDownload() = _GetDownload;
  const factory AnimeDownloadEvent.removeDownload({required String taskId}) = _RemoveDownload;
  const factory AnimeDownloadEvent.cancelDownload({required String taskId}) = _CancelDownload;
  const factory AnimeDownloadEvent.cancelAllDownload({required String taskId}) = _CancelAllDownload;
  const factory AnimeDownloadEvent.pauseDownload({required String taskId}) = _PauseDownload;
  const factory AnimeDownloadEvent.resumeDownload({required String taskId}) = _ResumeDownload;
  const factory AnimeDownloadEvent.retryDownload({required String taskId}) = _RetryDownload;
}