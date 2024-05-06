import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class AnimeGetVideoUseCase {
  final AnimeRepository _animeRepository;
  AnimeGetVideoUseCase({
    required AnimeRepository animeRepository,
  }) : _animeRepository = animeRepository;

  Future<Either<Failure<String>, List<VideoModel>>> call({
    required String endpoint,
    required AnimeModel animeModel,
  }) async {
    return await _animeRepository.animeGetVideo(endpoint: endpoint, animeModel: animeModel);
  }
}
