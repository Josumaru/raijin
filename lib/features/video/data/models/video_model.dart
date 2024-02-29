import 'package:hive/hive.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';
part 'video_model.g.dart';

@HiveType(typeId: 1)
class VideoModel extends VideoEntity {
  VideoModel({
    @HiveField(0)
    super.poster,
    @HiveField(1)
    super.endpoint,
    @HiveField(2)
    super.codename,
    @HiveField(3)
    super.episode,
    @HiveField(4)
    super.part,
    @HiveField(5)
    super.season,
    @HiveField(6)
    super.duration,
    @HiveField(7)
    super.position,
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
      duration: duration,
      position: position,
    );
  }
}
