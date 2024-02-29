import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/data/datasources/local/history/history_local_data_source.dart';
import 'package:raijin/features/anime/domain/repositories/history_repository.dart';
import 'package:raijin/features/video/data/models/video_model.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';

class HistoryRepositoryImpl implements HistoryRepository {

  final HistoryLocalDataSource historyLocalDataSource;
  const HistoryRepositoryImpl({required this.historyLocalDataSource});

  @override
  Future<Either<Failure, void>> deleteHistory({required VideoEntity videoEntity}) async {
    try {
      await historyLocalDataSource.deleteHistory(videoEntity: videoEntity);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<VideoEntity>>> getHistory() async {
    try {
      final List<VideoEntity> videoEntity = await historyLocalDataSource.getHistory();
      print('===========H=============');
      print(videoEntity[0].endpoint);
      print('===========H=============');
      return Right(videoEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> setHistory({required VideoModel videoModel}) async {
    try {
      await historyLocalDataSource.setHistory(videoModel: videoModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  
  
}