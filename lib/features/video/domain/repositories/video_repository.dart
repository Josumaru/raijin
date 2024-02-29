import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/video/data/models/video_model.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';

abstract class VideoRepositry {
  Future<Either<Failure, List<VideoEntity>>> getVideo({required String endpoint});
  Future<Either<Failure, List<VideoEntity>>> addHistoryVideo({required VideoModel videoModel});
  Future<Either<Failure, List<VideoEntity>>> getHistoryVideo({required VideoModel videoModel});
}
