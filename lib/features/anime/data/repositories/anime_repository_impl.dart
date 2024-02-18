import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_remote_data_source.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/domain/entities/anime_entity.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource animeRemoteDataSource;

  const AnimeRepositoryImpl({required this.animeRemoteDataSource});

  @override
  Future<Either<Failure, List<AnimeEntity>>> getAnime({required String status, required int page}) async {
    try {
      final List<AnimeModel> animeModel = await animeRemoteDataSource.getAnime(status: status, page: page);
      print(animeModel);
      final List<AnimeEntity> animeEntity = animeModel.map((e) => e.toEntity()).toList();
      return Right(animeEntity);
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
