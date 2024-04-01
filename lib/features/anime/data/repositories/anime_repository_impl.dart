import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_data_source.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource animeRemoteDataSource;
  const AnimeRepositoryImpl({required this.animeRemoteDataSource});
  @override
  Future<Either<Failure<String>, List<AnimeModel>>> getNewAnime({required String page}) async{
    try {
      final List<AnimeModel> r = await animeRemoteDataSource.animeGetNew(page: page);
      return Right(r);
    } catch (e) {
      final String message = e.toString();
      return Left(Failure.serverError(message: message));
    }
  }
}