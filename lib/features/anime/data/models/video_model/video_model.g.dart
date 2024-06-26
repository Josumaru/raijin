// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      quality: json['quality'] as String,
      mirror: json['mirror'] as String,
      videoEndpoint: json['videoEndpoint'] as String,
      endpoint: json['endpoint'] as String,
      baseUrl: json['baseUrl'] as String,
      poster: json['poster'] as String,
      title: json['title'] as String,
      synopsis: json['synopsis'] as String,
      thumbnail: json['thumbnail'] as String,
      genre: (json['genre'] as List<dynamic>).map((e) => e as String).toList(),
      anotherEpisode: (json['anotherEpisode'] as List<dynamic>)
          .map((e) => EpisodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      prevEpisode: json['prevEpisode'] as String?,
      nextEpisode: json['nextEpisode'] as String?,
      position: json['position'] as int?,
      duration: json['duration'] as int?,
      timestamp: _$JsonConverterFromJson<Object, FieldValue?>(
          json['timestamp'], const ServerTimeStampConverter().fromJson),
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'quality': instance.quality,
      'mirror': instance.mirror,
      'videoEndpoint': instance.videoEndpoint,
      'endpoint': instance.endpoint,
      'baseUrl': instance.baseUrl,
      'poster': instance.poster,
      'title': instance.title,
      'synopsis': instance.synopsis,
      'thumbnail': instance.thumbnail,
      'genre': instance.genre,
      'anotherEpisode': instance.anotherEpisode.map((e) => e.toJson()).toList(),
      'prevEpisode': instance.prevEpisode,
      'nextEpisode': instance.nextEpisode,
      'position': instance.position,
      'duration': instance.duration,
      'timestamp': const ServerTimeStampConverter().toJson(instance.timestamp),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
