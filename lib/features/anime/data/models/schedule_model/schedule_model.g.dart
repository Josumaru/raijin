// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleModelImpl _$$ScheduleModelImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleModelImpl(
      id: json['id'] as int,
      slug: json['slug'] as String,
      date: json['date'] as String,
      author: json['author'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      content: json['content'] as String,
      featured_img_src: json['featured_img_src'] as String,
      genre: json['genre'] as String,
      east_score: json['east_score'] as String,
      east_type: json['east_type'] as String,
      east_schedule: json['east_schedule'] as String,
      east_time: json['east_time'] as String,
    );

Map<String, dynamic> _$$ScheduleModelImplToJson(_$ScheduleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'date': instance.date,
      'author': instance.author,
      'type': instance.type,
      'title': instance.title,
      'url': instance.url,
      'content': instance.content,
      'featured_img_src': instance.featured_img_src,
      'genre': instance.genre,
      'east_score': instance.east_score,
      'east_type': instance.east_type,
      'east_schedule': instance.east_schedule,
      'east_time': instance.east_time,
    };
