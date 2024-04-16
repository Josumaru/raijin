import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_data_source.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource animeRemoteDataSource;
  const AnimeRepositoryImpl({required this.animeRemoteDataSource});
  @override
  Future<Either<Failure<String>, List<AnimeModel>>> getNewAnime(
      {required int page}) async {
    try {
      final List<AnimeModel> r =
          await animeRemoteDataSource.animeGetNew(page: page);
      return Right(r);
    } catch (e) {
      final String message = e.toString();
      return Left(Failure.serverError(message: message));
    }
  }

  @override
  Future<Either<Failure<String>, List<AnimeModel>>> animeGet({
    required String status,
    required String order,
    required String type,
  }) async {
    try {
      final List<AnimeModel> r = await animeRemoteDataSource.animeGet(
        order: order,
        status: status,
        type: type,
      );
      return Right(r);
    } catch (e) {
      final String message = e.toString();
      return Left(Failure.serverError(message: message));
    }
  }

  @override
  Future<Either<Failure<String>, AnimeModel>> animeGetDetail({
    required String endpoint,
  }) async {
    try {
      final AnimeModel r =
          await animeRemoteDataSource.animeDetail(endpoint: endpoint);
      return Right(r);
    } catch (e) {
      final message = e.toString();
      return Left(Failure.serverError(message: message));
    }
  }

  @override
  Future<Either<Failure<String>, List<VideoModel>>> animeGetVideo({
    required String endpoint,
  }) async {
    try {
      final List<VideoModel> r =
          await animeRemoteDataSource.animeVideo(endpoint: endpoint);
      return Right(r);
    } catch (e) {
      final message = e.toString();
      return Left(Failure.serverError(message: message));
    }
  }
}
