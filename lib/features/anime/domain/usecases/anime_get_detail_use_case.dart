import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/core/usecases/use_case.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class AnimeGetDetailUseCase extends UseCase<Either<Failure<String>, AnimeModel>, String> {
  final AnimeRepository animeRepository;
  AnimeGetDetailUseCase({required this.animeRepository});
  @override
  Future<Either<Failure<String>, AnimeModel>> call({required String? params}) async {
    return await animeRepository.animeGetDetail(endpoint: params!);
  }
}