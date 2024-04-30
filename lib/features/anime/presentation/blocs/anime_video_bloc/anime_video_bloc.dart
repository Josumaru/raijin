import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/core/usecases/toast_usecase/toas_use_case.dart';
import 'package:raijin/features/anime/data/models/episode_model/episode_model.dart';
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
    on<AnimeVideoEvent>((event, emit) async {
      await event.map(
        getVideo: (value) => _getVideo(endpoint: value.endpoint, emit: emit),
        showControl: (value) =>
            _showControll(showControll: value.showControl, emit: emit),
        seekPosition: (value) =>
            _seekPosition(positon: value.position, emit: emit),
        changeResolution: (value) => () {},
        changeEpisode: (value) => () {},
        playVideo: (value) => _playVideo(play: value.isPlay, emit: emit),
        addHistory: (value) => () {},
        setPosition: (value) => _setPosition(
            position: value.position, duration: value.duration, emit: emit),
          setBuffering: (value) => _setBuffering(buffering: value.buffering, emit: emit),
      );
    });
  }

  _setBuffering({required bool buffering, required Emitter emit}) {
    emit(state.copyWith(buffering: buffering));

  }

  _showControll({required bool showControll, required Emitter emit}) {
    emit(state.copyWith(showControll: showControll));
  }

  _seekPosition({required double positon, required Emitter emit}) {
    emit(state.copyWith(sliderPosition: positon));
  }

  _setPosition({
    required int position,
    required int duration,
    required Emitter emit,
  }) {
    emit(state.copyWith(videoPosition: position, videoDuration: duration));
  }

  _getVideo({required String endpoint, required Emitter emit}) async {
    emit(state.copyWith(
      loading: true,
    ));
    final data = await _animeGetVideoUseCase(endpoint: endpoint);
    data.fold(
      (l) => emit(state.copyWith(error: true)),
      (r) => emit(state.copyWith(
        videoList: r,
        loading: false,
        buffering: true,
        mirror: r.first.mirror,
        initialize: true,
      )),
    );
  }

  Future<void> _playVideo({required bool play, required Emitter emit}) async {
    emit(state.copyWith(playing: !play, initialize: false));
  }

  // _showControl(bool isShow) {
  //   emit(state.copyWith(
  //     isShowControll: !isShow,
  //   ));
  // }

  // _seekPosition(int position) {
  //   emit(state.copyWith(videoPosition: 12));
  //   _toastUseCase(params: '$position');
  // }

  // _changeResolution(String mirror) {
  //   emit(state.copyWith());
  //   _toastUseCase(params: mirror);
  // }
  // _animeGetVideo(String endpoint) async {
  //   _toastUseCase(params: 'Please Wait');
  //   emit(const AnimeVideoState.loading());
  //   final data = await _animeGetVideoUseCase(endpoint: endpoint);
  //   data.fold(
  //     (l) {
  //       _toastUseCase(params: l.messages);
  //       return emit(AnimeVideoState.error(message: l.messages));
  //     },
  //     (r) {
  //       _toastUseCase(params: 'Hosted on ${r.first.mirror}');
  //       return emit(AnimeVideoState.loaded(videoModel: r));
  //     },
  //   );
  // }
}
