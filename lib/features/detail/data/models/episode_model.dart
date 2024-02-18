import 'package:raijin/features/detail/domain/entities/episode_entity.dart';

class EpisodeModel extends EpisodeEntity {
  EpisodeModel({
    required super.title,
    required super.endpoint,
    required super.date,
    required super.episode,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      title: json['title'],
      endpoint: json['endpoint'],
      date: json['date'],
      episode: json['episode_endpoint']
    );
  }
}
