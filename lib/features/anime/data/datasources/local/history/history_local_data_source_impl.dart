import 'package:hive/hive.dart';
import 'package:raijin/features/anime/data/datasources/local/history/history_local_data_source.dart';
import 'package:raijin/features/video/data/models/video_model.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';

class HistoryLocalDataSourceImpl implements HistoryLocalDataSource {

  final Box<VideoModel> historyBox;
  const HistoryLocalDataSourceImpl({required this.historyBox});

  @override
  Future<void> deleteHistory({required VideoEntity videoEntity}) async {
    return historyBox.delete(videoEntity.endpoint);
  }

  @override
  Future<List<VideoEntity>> getHistory() async {
    final List<VideoEntity> videoEntity = historyBox.values.map((e) => e.toEntity()).toList();
    print('======================================');
    print(historyBox.values.first);
    print('======================================');
    return videoEntity;
  }

  @override
  Future<void> setHistory({required VideoModel videoModel}) {
    print('============video key ${videoModel}=========');
    return historyBox.put(videoModel.endpoint, videoModel);
  }

}