import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/episode_model.dart';
import 'package:raijin/features/anime/domain/entities/anime_entity.dart';
part 'anime_model.freezed.dart';

@freezed
abstract class AnimeModel with _$AnimeModel {
  const factory AnimeModel({
    required String title,
    required String endpoint,
    required String poster,
    List<String>? genre,
    String? episode,
    String? type,
    String? description,
    double? score,
    String? released,
    String? status,
    String? japanese,
    String? source,
    String? english,
    String? duration,
    String? season,
    String? studio,
    String? producers,
    String? trailer,
    List<EpisodeModel>? episodeList,
    int? totalEpisode,
  }) = _AnimeModel;

  factory AnimeModel.fromEntity({required AnimeEntity animeEntity}) {
    return AnimeModel(
      title: animeEntity.title,
      endpoint: animeEntity.endpoint,
      poster: animeEntity.poster,
    );
  }
}
