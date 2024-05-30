import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class AnimeGetGenreUseCase {
  final AnimeRepository animeRepository;
  const AnimeGetGenreUseCase({required this.animeRepository});
  Future<Either<Failure<String>, List<String>>> call() async {
    return await animeRepository.animeGetGenre();
  }
}