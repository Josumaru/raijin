import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/episode_model/episode_model.dart';

part 'video_model.freezed.dart';
// part 'video_model.g.dart';

@freezed
class VideoModel with _$VideoModel {
  factory VideoModel({
    required String quality,
    required String mirror,
    required String endpoint,
    required String poster,
    required String title,
    required List<EpisodeModel> anotherEpisode,
    String? prevEpisode,
    String? nextEpisode,
  }) = _VideoModel;
}
