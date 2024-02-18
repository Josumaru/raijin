import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';
import 'package:raijin/features/video/domain/repositories/video_repository.dart';

class GetVideoUseCase {
  final VideoRepositry videoRepositry;

  const GetVideoUseCase({required this.videoRepositry});

  Future<Either<Failure, List<VideoEntity>>> call({required String endpoint}) async {
    return await videoRepositry.getVideo(endpoint: endpoint);
  }
}
