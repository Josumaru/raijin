import 'package:freezed_annotation/freezed_annotation.dart';
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
  }) = _AnimeModel;

  factory AnimeModel.fromEntity({required AnimeEntity animeEntity}) {
    return AnimeModel(
      title: animeEntity.title,
      endpoint: animeEntity.endpoint,
      poster: animeEntity.poster,
    );
  }
}
