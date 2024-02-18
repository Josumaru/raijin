import 'package:raijin/features/detail/data/models/episode_model.dart';
import 'package:raijin/features/detail/domain/entities/detail_entity.dart';
import 'package:raijin/features/detail/domain/entities/episode_entity.dart';

class DetailModel extends DetailEntity {
  const DetailModel({
    required super.title,
    required super.japanese,
    required super.score,
    required super.producer,
    required super.type,
    required super.status,
    required super.totalEpisode,
    required super.synopsis,
    required super.duration,
    required super.thumbnail,
    required super.releaseDate,
    required super.studio,
    required super.genre,
    required super.episodes,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    List<EpisodeEntity> episodeEntity =
        (json['episodes'] as List).map((e) => EpisodeModel.fromJson(e)).toList();

    return DetailModel(
      title: json['title'],
      japanese: json['japanese'],
      score: json['score'],
      producer: json['producer'],
      type: json['type'],
      status: json['status'],
      thumbnail: json['thumbnail'],
      totalEpisode: json['total_episode'],
      duration: json['duration'],
      synopsis: json['synopsis'],
      releaseDate: json['release_date'],
      studio: json['studio'],
      genre: json['genre'],
      episodes: episodeEntity,
    );
  }

  DetailEntity toEntity() {
    return DetailEntity(
      title: title,
      japanese: japanese,
      score: score,
      producer: producer,
      type: type,
      status: status,
      totalEpisode: totalEpisode,
      duration: duration,
      thumbnail: thumbnail,
      releaseDate: releaseDate,
      studio: studio,
      genre: genre,
      synopsis: synopsis,
      episodes: episodes,
    );
  }

  
}
