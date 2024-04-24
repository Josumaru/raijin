import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class AnimeGetMovieUseCase {
  final AnimeRepository _animeRepository;
  AnimeGetMovieUseCase({required AnimeRepository animeRepository})
      : _animeRepository = animeRepository;
  Future<Either<Failure<String>, List<AnimeModel>>> call({
    required String status,
    required String order,
    required String type,
    required String genre,
    required int page,
  }) async {
    return await _animeRepository.animeGet(
      status: status,
      order: order,
      type: type,
      genre: genre,
      page: page,
    );
  }
}
