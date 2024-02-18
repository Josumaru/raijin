import 'package:raijin/features/video/domain/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  VideoModel({
    required super.poster,
    required super.endpoint,
    required super.codename,
    required super.episode,
    required super.part,
    required super.season,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      poster: json['poster'],
      endpoint: json['endpoint'],
      season: json['season'],
      codename: json['codename'],
      episode: json['episode'],
      part: json['part'],
    );
  }

  VideoEntity toEntity() {
    return VideoEntity(
      poster: poster,
      endpoint: endpoint,
      codename: codename,
      episode: episode,
      part: part,
      season: season,
    );
  }
}
