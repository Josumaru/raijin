import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/domain/entities/anime_entity.dart';
part 'anime_model.freezed.dart';

@freezed
abstract class AnimeModel with _$AnimeModel {
  const factory AnimeModel({
    required String title,
    required String endpoint,
    required String episode,
    required String poster,
    required String released,
  }) = _AnimeModel;

  factory AnimeModel.fromEntity({required AnimeEntity animeEntity}) {
    return AnimeModel(
      title: animeEntity.title,
      endpoint: animeEntity.endpoint,
      episode: animeEntity.episode,
      poster: animeEntity.poster,
      released: animeEntity.released,
    );
  }
}
