import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/episode_model/episode_model.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class VideoModel with _$VideoModel {
  const VideoModel._();
  factory VideoModel({
    required String quality,
    required String mirror,
    required String endpoint,
    required String baseUrl,
    required String poster,
    required String title,
    required String synopsis,
    required String thumbnail,
    required List<String> genre,
    required List<EpisodeModel> anotherEpisode,
    String? prevEpisode,
    String? nextEpisode,
    int? position,
    int? duration,
    DateTime? date,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return _$VideoModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VideoModelToJson(this)
      ..update(
        'genre',
        (value) => value.map((e) => e.toString()).toList(),
      )
      ..update(
        'anotherEpisode',
        (value) => value.map((e) => e.toString()).toList(),
      );
  }
}
