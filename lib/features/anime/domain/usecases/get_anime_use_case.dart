import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/domain/entities/anime_entity.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class GetAnimeUseCase {
  final AnimeRepository animeRepository;

  const GetAnimeUseCase({required this.animeRepository});

  Future<Either<Failure, List<AnimeEntity>>> call({required String status, required int page}) async {
    return await animeRepository.getAnime(status: status, page: page);
  }
}
