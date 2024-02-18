import 'package:raijin/features/anime/domain/entities/anime_entity.dart';

class AnimeModel extends AnimeEntity {
  const AnimeModel({
    required super.title,
    required super.thumbnail,
    required super.endpoint,
    required super.date,
    required super.episode,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      title: json['title'],
      thumbnail: json['thumbnail'],
      endpoint: json['endpoint'],
      date: json['date'],
      episode: json['episode'],
    );
  }

  AnimeEntity toEntity() {
    return AnimeEntity(
      title: title,
      thumbnail: thumbnail,
      endpoint: endpoint,
      date: date,
      episode: episode,
    );
  }
}
