import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/domain/repositories/history_repository.dart';
import 'package:raijin/features/video/data/models/video_model.dart';

class SetHistoryUseCase {
  final HistoryRepository historyRepository;
  const SetHistoryUseCase({required this.historyRepository});

  Future<Either<Failure, void>> call({required VideoModel videoModel}) async {
    return await historyRepository.setHistory(videoModel: videoModel);
  }
}