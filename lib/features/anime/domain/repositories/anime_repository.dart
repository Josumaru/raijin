import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/domain/entities/anime_entity.dart';

abstract class AnimeRepository {
  Future<Either<Failure, List<AnimeEntity>>> getAnime({required String status, required int page});
  // Future<Either<Failure, List<AnimeEntity>>> getCompleteAnime();
  // Future<Either<Failure, List<AnimeEntity>>> getDetailAnime();
}