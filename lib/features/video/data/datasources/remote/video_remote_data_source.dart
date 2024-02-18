import 'package:raijin/features/video/data/models/video_model.dart';

abstract class VideoRemoteDataSource {
  Future<List<VideoModel>> getVideo({required String endpoint});
}