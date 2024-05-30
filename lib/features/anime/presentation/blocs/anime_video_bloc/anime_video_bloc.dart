import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_video_use_case.dart';

part 'anime_video_event.dart';
part 'anime_video_state.dart';
part 'anime_video_bloc.freezed.dart';

class AnimeVideoBloc extends Bloc<AnimeVideoEvent, AnimeVideoState> {
  final AnimeGetVideoUseCase _animeGetVideoUseCase;
  AnimeVideoBloc({
    required AnimeGetVideoUseCase animeGetVideoUseCase,
  })  : _animeGetVideoUseCase = animeGetVideoUseCase,
        super(AnimeVideoState.started()) {
    on<AnimeVideoEvent>(
      (event, emit) async {
        await event.map(
          getVideo: (value) => _getVideo(
            emit: emit,
            endpoint: value.endpoint,
            baseUrl: value.baseUrl,
            position: value.position,
            server: value.server,
            videoPath: value.videoPath,
          ),
        );
      },
    );
  }

  _getVideo({
    required String endpoint,
    required Emitter emit,
    required String baseUrl,
    required int position,
    required String server,
    String? videoPath,
  }) async {
    emit(state.copyWith(
      loading: true,
      error: false,
      baseUrl: baseUrl,
      endpoint: endpoint,
    ));
    final data = await _animeGetVideoUseCase(
      endpoint: endpoint,
      baseUrl: baseUrl,
      position: position,
      server: server,
    );

    if (videoPath != null) {
      emit(state.copyWith(videoPath: videoPath));
    } else {
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
}
