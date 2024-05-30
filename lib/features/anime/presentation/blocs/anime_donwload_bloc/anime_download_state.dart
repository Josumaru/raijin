part of 'anime_download_bloc.dart';

@freezed
class AnimeDownloadState with _$AnimeDownloadState {
  const AnimeDownloadState._();
  const factory AnimeDownloadState({
    required bool loading,
    required bool error,
    required List<DownloadTask> task,
  }) = _AnimeDownloadState;

  factory AnimeDownloadState.started() {
    return const AnimeDownloadState(
      task: [],
      error: false,
      loading: false,
    );
  }
}
