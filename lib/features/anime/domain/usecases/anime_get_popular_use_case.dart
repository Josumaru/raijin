import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/core/usecases/use_case.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class AnimeGetPopularUseCase
    extends UseCase<Either<Failure<String>, List<AnimeModel>>, int> {
  final AnimeRepository animeRepository;

  AnimeGetPopularUseCase({required this.animeRepository});

  @override
  Future<Either<Failure<String>, List<AnimeModel>>> call({int? params}) async {
    return await animeRepository.animeGetPopular();
  }
}
