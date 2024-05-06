import 'package:freezed_annotation/freezed_annotation.dart';
part 'episode_model.freezed.dart';
part 'episode_model.g.dart';

@freezed
abstract class EpisodeModel with _$EpisodeModel {
  const factory EpisodeModel({
    required String endpoint,
    required int episode,
    required String title,
    required String date,
    String? thumbnail,
  }) = _EpisodeModel;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => _$EpisodeModelFromJson(json);
}
