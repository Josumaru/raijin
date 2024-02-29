import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/domain/repositories/history_repository.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';

class DeleteHistoryUseCase{
  final HistoryRepository historyRepository;
  const DeleteHistoryUseCase({required this.historyRepository});

  Future<Either<Failure, void>> call({required VideoEntity videoEntity}) async {
    return await historyRepository.deleteHistory(videoEntity: videoEntity);
  }
}