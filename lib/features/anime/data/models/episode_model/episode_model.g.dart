// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeModelImpl _$$EpisodeModelImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeModelImpl(
      endpoint: json['endpoint'] as String,
      episode: json['episode'] as int,
      title: json['title'] as String,
      date: json['date'] as String,
      poster: json['poster'] as String?,
    );

Map<String, dynamic> _$$EpisodeModelImplToJson(_$EpisodeModelImpl instance) =>
    <String, dynamic>{
      'endpoint': instance.endpoint,
      'episode': instance.episode,
      'title': instance.title,
      'date': instance.date,
      'poster': instance.poster,
    };
