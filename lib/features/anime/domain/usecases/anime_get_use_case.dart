import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class AnimeGetUseCase {
  final AnimeRepository animeRepository;

  AnimeGetUseCase({required this.animeRepository});

  Future<Either<Failure<String>, List<AnimeModel>>> call({
    required String status,
    required String order,
    required String type,
    required int page,
  }) async {
    return await animeRepository.animeGet(
      order: order,
      status: status,
      type: type,
      page: page,
    );
  }
}
