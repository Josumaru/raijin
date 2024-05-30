// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferencesModel _$UserPreferencesModelFromJson(
        Map<String, dynamic> json) =>
    UserPreferencesModel(
      theme: json['theme'] as String?,
      resolution: json['resolution'] as String?,
      playback: (json['playback'] as num?)?.toDouble(),
      photoPath: json['photoPath'] as String?,
      username: json['username'] as String?,
      server: json['server'] as String?,
    );

Map<String, dynamic> _$UserPreferencesModelToJson(
        UserPreferencesModel instance) =>
    <String, dynamic>{
      'theme': instance.theme,
      'resolution': instance.resolution,
      'playback': instance.playback,
      'photoPath': instance.photoPath,
      'username': instance.username,
      'server': instance.server,
    };
