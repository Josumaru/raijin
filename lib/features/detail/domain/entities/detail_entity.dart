import 'package:equatable/equatable.dart';
import 'package:raijin/features/detail/domain/entities/episode_entity.dart';

class DetailEntity extends Equatable {
  final String title,
      japanese,
      score,
      producer,
      type,
      status,
      totalEpisode,
      duration,
      releaseDate,
      thumbnail,
      studio,
      synopsis,
      genre;
  final List<EpisodeEntity> episodes;

  const DetailEntity({
    required this.title,
    required this.japanese,
    required this.score,
    required this.producer,
    required this.type,
    required this.status,
    required this.synopsis,
    required this.totalEpisode,
    required this.duration,
    required this.releaseDate,
    required this.studio,
    required this.genre,
    required this.episodes,
    required this.thumbnail,
  });

  @override
  List<Object?> get props => [
        title,
        japanese,
        score,
        producer,
        type,
        status,
        totalEpisode,
        duration,
        synopsis,
        releaseDate,
        studio,
        genre,
        episodes,
        thumbnail
      ];
}
