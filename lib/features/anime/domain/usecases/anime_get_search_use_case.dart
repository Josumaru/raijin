import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/core/usecases/use_case.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class AnimeGetSearchUseCase
    extends UseCase<Either<Failure<String>, List<AnimeModel>>, String> {
  AnimeGetSearchUseCase({
    required AnimeRepository animeRepository,
  }) : _animeRepository = animeRepository;
  final AnimeRepository _animeRepository;
  @override
  Future<Either<Failure<String>, List<AnimeModel>>> call({
    required String? params,
  })async  {
    return await _animeRepository.animeGetSearch(query: params!);
  }
}
