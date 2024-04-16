import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/episode_model/episode_model.dart';
part 'video_model.freezed.dart';

@freezed
abstract class VideoModel with _$VideoModel {
  factory VideoModel({
    required String quality,
    required String mirror,
    required String endpoint,
    required String poster,
    required String title,
    required String? prevEpisode,
    required String? nextEpisode,
    required List<EpisodeModel> anotherEpisode,
  }) = _VideoModel;
}
