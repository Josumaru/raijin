import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/video/data/datasources/remote/video_remote_data_source.dart';
import 'package:raijin/features/video/data/models/video_model.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';
import 'package:raijin/features/video/domain/repositories/video_repository.dart';

class VideoRepositryImpl implements VideoRepositry {

  final VideoRemoteDataSource videoRemoteDataSource;

  const VideoRepositryImpl({required this.videoRemoteDataSource});

  @override
  Future<Either<Failure, List<VideoEntity>>> getVideo({required String endpoint}) async {
    try {
      final List<VideoModel> videoModel = await videoRemoteDataSource.getVideo(endpoint: endpoint);
      print(videoModel);
      final List<VideoEntity> videoEntity = videoModel.map((e) => e.toEntity()).toList();
      return Right(videoEntity);
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<VideoEntity>>> addHistoryVideo({required VideoModel videoModel}) {
    // TODO: implement addHistoryVideo
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<VideoEntity>>> getHistoryVideo({required VideoModel videoModel}) {
    // TODO: implement getHistoryVideo
    throw UnimplementedError();
  }

}