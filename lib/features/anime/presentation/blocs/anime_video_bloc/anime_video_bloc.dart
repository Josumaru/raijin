// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/core/usecases/toast_usecase/toas_use_case.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_video_use_case.dart';

part 'anime_video_event.dart';
part 'anime_video_state.dart';
part 'anime_video_bloc.freezed.dart';

class AnimeVideoBloc extends Bloc<AnimeVideoEvent, AnimeVideoState> {
  final AnimeGetVideoUseCase _animeGetVideoUseCase;
  final ToastUseCase _toastUseCase;
  AnimeVideoBloc({
    required AnimeGetVideoUseCase animeGetVideoUseCase,
    required ToastUseCase toastUseCase,
  })  : 
        _toastUseCase = toastUseCase,
        _animeGetVideoUseCase = animeGetVideoUseCase,
        super(const AnimeVideoState.initial()) {
    on<AnimeVideoEvent>((event, emit) {
      event.when(
        animeGetVideo: (endpoint) => _animeGetVideo(endpoint),
      );
    });
  }
  _animeGetVideo(String endpoint) async {
    _toastUseCase(params: 'Please Wait');
    emit(const AnimeVideoState.loading());
    final data = await _animeGetVideoUseCase(endpoint: endpoint);
    data.fold(
      (l) {
        _toastUseCase(params: l.messages);
        return emit(AnimeVideoState.error(message: l.messages));
      },
      (r) {
        _toastUseCase(params: 'Hosted on ${r.first.mirror}');
        return emit(AnimeVideoState.loaded(videoModel: r));
      },
    );
  }
}
