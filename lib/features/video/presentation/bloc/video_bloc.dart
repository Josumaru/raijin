import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:raijin/features/detail/domain/entities/episode_entity.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';
import 'package:raijin/features/video/domain/usecases/get_video_use_case.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final GetVideoUseCase getVideoUseCase;

  VideoBloc({required this.getVideoUseCase}) : super(VideoInitial(videoEntity: List.empty())) {

    on<GetVideoEvent>((event, emit) async {
      if (state is !VideoLoading) {
        emit(
          VideoLoading(
            videoEntity: [
              VideoEntity(
                poster: '',
                endpoint: '',
                codename: '',
                episode: event.episodeEntity.episode,
                part: 0,
                season: 0,
              )
            ],
          ),
        );

        final data = await getVideoUseCase(endpoint: event.episodeEntity.endpoint);

        data.fold(
          (l) => emit(
            const VideoFailed(
              videoEntity: [
                VideoEntity(
                  poster: 'https://oldworldgods.com/wp-content/uploads/2023/06/raijin1.jpg',
                  endpoint: '',
                  codename: 'RJN',
                  episode: 16,
                  part: 32,
                  season: 64
                )
              ],
            ),
          ),
          (r) => emit(VideoLoaded(videoEntity: r)),
        );
      }
    });
  }
}
