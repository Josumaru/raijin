import 'package:dio/dio.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/video/data/datasources/remote/video_remote_data_source.dart';
import 'package:raijin/features/video/data/models/video_model.dart';

class VideoRemoteDataSourceImpl implements VideoRemoteDataSource {

  final Dio dio = Dio();

  @override
  Future<List<VideoModel>> getVideo({required String endpoint}) async {
    print('$kRaijinEndpoint/api/stream/$endpoint');
    Response response = await dio.get('$kRaijinEndpoint/api/stream/$endpoint');
    if (response.statusCode == 200) {
      final List<VideoModel> videoModel = (response.data['data'] as List).map((e) => VideoModel.fromJson(e)).toList();
      return videoModel;
    }
    throw ServerFailure(message: 'Error while get video data');
  }

}