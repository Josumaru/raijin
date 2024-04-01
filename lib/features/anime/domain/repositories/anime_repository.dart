import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';

abstract class AnimeRepository {
  Future<Either<Failure<String>, List<AnimeModel>>> getNewAnime({required String page});
}