import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/domain/repositories/history_repository.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';

class GetHistoryUseCase{
  final HistoryRepository historyRepository;
  const GetHistoryUseCase({required this.historyRepository});

  Future<Either<Failure, List<VideoEntity>>> call() async {
    return await historyRepository.getHistory();
  }
}