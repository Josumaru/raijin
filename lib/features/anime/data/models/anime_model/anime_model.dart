import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/episode_model/episode_model.dart';

part 'anime_model.freezed.dart';
part 'anime_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
abstract class AnimeModel with _$AnimeModel {
  const AnimeModel._();
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

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return _$AnimeModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnimeModelToJson(this);
}
