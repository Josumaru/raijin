import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';

abstract class VideoRepositry {
  Future<Either<Failure, List<VideoEntity>>> getVideo({required String endpoint});
}
