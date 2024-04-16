import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/core/usecases/use_case.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class AnimeGetNewUseCase
    extends UseCase<Either<Failure<String>, List<AnimeModel>>, int> {
  final AnimeRepository animeRepository;

  AnimeGetNewUseCase({required this.animeRepository});

  @override
  Future<Either<Failure<String>, List<AnimeModel>>> call(
      {required int? params}) async {
    return await animeRepository.getNewAnime(page: params!);
  }
}
