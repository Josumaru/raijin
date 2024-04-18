// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimeModelImpl _$$AnimeModelImplFromJson(Map<String, dynamic> json) =>
    _$AnimeModelImpl(
      title: json['title'] as String,
      endpoint: json['endpoint'] as String,
      poster: json['poster'] as String,
      genre:
          (json['genre'] as List<dynamic>?)?.map((e) => e as String).toList(),
      episode: json['episode'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      released: json['released'] as String?,
      status: json['status'] as String?,
      japanese: json['japanese'] as String?,
      source: json['source'] as String?,
      english: json['english'] as String?,
      duration: json['duration'] as String?,
      season: json['season'] as String?,
      studio: json['studio'] as String?,
      producers: json['producers'] as String?,
      trailer: json['trailer'] as String?,
      episodeList: (json['episodeList'] as List<dynamic>?)
          ?.map((e) => EpisodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalEpisode: json['totalEpisode'] as int?,
    );

Map<String, dynamic> _$$AnimeModelImplToJson(_$AnimeModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'endpoint': instance.endpoint,
      'poster': instance.poster,
      'genre': instance.genre,
      'episode': instance.episode,
      'type': instance.type,
      'description': instance.description,
      'score': instance.score,
      'released': instance.released,
      'status': instance.status,
      'japanese': instance.japanese,
      'source': instance.source,
      'english': instance.english,
      'duration': instance.duration,
      'season': instance.season,
      'studio': instance.studio,
      'producers': instance.producers,
      'trailer': instance.trailer,
      'episodeList': instance.episodeList,
      'totalEpisode': instance.totalEpisode,
    };
