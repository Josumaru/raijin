import 'package:raijin/features/video/data/models/video_model.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';

abstract class HistoryLocalDataSource {
  Future<List<VideoEntity>> getHistory();
  Future<void> setHistory({required VideoModel videoModel});
  Future<void> deleteHistory({required VideoEntity videoEntity});
}