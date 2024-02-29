import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/video/data/models/video_model.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';

abstract class HistoryRepository{
  Future<Either<Failure, List<VideoEntity>>> getHistory();
  Future<Either<Failure, void>> setHistory({required VideoModel videoModel});
  Future<Either<Failure, void>> deleteHistory({required VideoEntity videoEntity});
}