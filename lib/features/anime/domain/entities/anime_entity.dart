import 'package:freezed_annotation/freezed_annotation.dart';
part 'anime_entity.freezed.dart';

@freezed
abstract class AnimeEntity with _$AnimeEntity {
  const factory AnimeEntity({
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
  }) = _AnimeEntity;
}
