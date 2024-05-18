import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/episode_model/episode_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
@JsonSerializable(
    explicitToJson: true, converters: [ServerTimeStampConverter()])
class VideoModel with _$VideoModel {
  const VideoModel._();
  const factory VideoModel({
    required String quality,
    required String mirror,
    required String videoEndpoint,
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
    FieldValue? timestamp,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return _$VideoModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}

class ServerTimeStampConverter implements JsonConverter<FieldValue?, Object> {
  const ServerTimeStampConverter();
  @override
  FieldValue? fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue? object) {
    return object!;
  }
}
