import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/core/usecases/toast_usecase/toas_use_case.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_video_use_case.dart';
import 'package:video_player/video_player.dart';

part 'anime_video_event.dart';
part 'anime_video_state.dart';
part 'anime_video_bloc.freezed.dart';

class AnimeVideoBloc extends Bloc<AnimeVideoEvent, AnimeVideoState> {
  final AnimeGetVideoUseCase _animeGetVideoUseCase;
  final ToastUseCase _toastUseCase;
  final VideoPlayerController _controller;
  AnimeVideoBloc({
    required AnimeGetVideoUseCase animeGetVideoUseCase,
    required ToastUseCase toastUseCase,
    required VideoPlayerController controller,
  })  : _toastUseCase = toastUseCase,
        _animeGetVideoUseCase = animeGetVideoUseCase,
        _controller = controller,
        super(AnimeVideoState.started()) {
    on<AnimeVideoEvent>(
      (event, emit) async {
        await event.map(
          getVideo: (value) => _getVideo(emit: emit, endpoint: value.endpoint, baseUrl: value.baseUrl),
        );
      },
    );
  }

  _getVideo({
    required String endpoint,
    required Emitter emit,
    required String baseUrl,
  }) async {
    emit(state.copyWith(loading: true));
    final data = await _animeGetVideoUseCase(endpoint: endpoint, baseUrl: baseUrl);

    data.fold(
      (l) {
        emit(state.copyWith(error: true));
      },
      (r) {
        emit(state.copyWith(
          loading: false,
          videoList: r,
        ));
      },
    );
  }
}
