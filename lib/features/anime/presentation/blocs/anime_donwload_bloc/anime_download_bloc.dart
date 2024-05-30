import 'package:bloc/bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/domain/usecases/anime_download_use_case.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_download_use_case.dart';

part 'anime_download_event.dart';
part 'anime_download_state.dart';
part 'anime_download_bloc.freezed.dart';

class AnimeDownloadBloc extends Bloc<AnimeDownloadEvent, AnimeDownloadState> {
  final AnimeGetDownloadUseCase animeGetDownloadUseCase;
  final AnimeDownloadUseCase animeDownloadUseCase;
  AnimeDownloadBloc({required this.animeGetDownloadUseCase, required this.animeDownloadUseCase})
      : super(AnimeDownloadState.started()) {
    on<AnimeDownloadEvent>((event, emit) async {
      await event.map(
        download: (value) =>
            _download(params: value.params, emit: emit),
        getDownload: (value) => _getDownload(emit: emit),
        removeDownload: (value) =>
            _removeDownload(taskId: value.taskId, emit: emit),
        cancelDownload: (value) =>
            _cancelDownload(taskId: value.taskId, emit: emit),
        cancelAllDownload: (value) => _cancelAllDownload(emit: emit),
        pauseDownload: (value) =>
            _pauseDownload(taskId: value.taskId, emit: emit),
        resumeDownload: (value) =>
            _resumeDownload(taskId: value.taskId, emit: emit),
        retryDownload: (value) =>
            _retryDownload(taskId: value.taskId, emit: emit),
      );
    });
  }

  _retryDownload({required String taskId, required Emitter emit}) async {
    FlutterDownloader.retry(taskId: taskId);
    emit(state.copyWith(loading: true));
    final data = await animeGetDownloadUseCase();
    data.fold((l) {
      emit(state.copyWith(
        loading: false,
        error: true,
      ));
    }, (r) {
      emit(state.copyWith(
        task: r,
        loading: false,
      ));
    });
  }

  _resumeDownload({required String taskId, required Emitter emit}) async {
    FlutterDownloader.resume(taskId: taskId);
    emit(state.copyWith(loading: true));
    final data = await animeGetDownloadUseCase();
    data.fold((l) {
      emit(state.copyWith(
        loading: false,
        error: true,
      ));
    }, (r) {
      emit(state.copyWith(
        task: r,
        loading: false,
      ));
    });
  }

  _pauseDownload({required String taskId, required Emitter emit}) async {
    FlutterDownloader.pause(taskId: taskId);
    emit(state.copyWith(loading: true));
    final data = await animeGetDownloadUseCase();
    data.fold((l) {
      emit(state.copyWith(
        loading: false,
        error: true,
      ));
    }, (r) {
      emit(state.copyWith(
        task: r,
        loading: false,
      ));
    });
  }

  _cancelAllDownload({required Emitter emit}) async {
    FlutterDownloader.cancelAll();
    emit(state.copyWith(loading: true));
    final data = await animeGetDownloadUseCase();
    data.fold((l) {
      emit(state.copyWith(
        loading: false,
        error: true,
      ));
    }, (r) {
      emit(state.copyWith(
        task: r,
        loading: false,
      ));
    });
  }

  _removeDownload({required String taskId, required Emitter emit}) async {
    FlutterDownloader.remove(taskId: taskId);
    emit(state.copyWith(loading: true));
    final data = await animeGetDownloadUseCase();
    data.fold((l) {
      emit(state.copyWith(
        loading: false,
        error: true,
      ));
    }, (r) {
      emit(state.copyWith(
        task: r,
        loading: false,
      ));
    });
  }

  _cancelDownload({required String taskId, required Emitter emit}) async {
    FlutterDownloader.cancel(taskId: taskId);
    final data = await animeGetDownloadUseCase();
    data.fold((l) {
      emit(state.copyWith(
        loading: false,
        error: true,
      ));
    }, (r) {
      emit(state.copyWith(
        task: r,
        loading: false,
      ));
    });
  }

  _download({required DownloadParams params, required Emitter emit}) async {
    await animeDownloadUseCase(params: params);
    final data = await animeGetDownloadUseCase();
    data.fold((l) {
      emit(state.copyWith(
        loading: false,
        error: true,
      ));
    }, (r) {
      emit(state.copyWith(
        task: r,
        loading: false,
      ));
    });
  }
  _getDownload({required Emitter emit}) async {
    final data = await animeGetDownloadUseCase();
    data.fold((l) {
      emit(state.copyWith(
        loading: false,
        error: true,
      ));
    }, (r) {
      emit(state.copyWith(
        task: r,
        loading: false,
      ));
    });
  }
}
