import 'package:html/parser.dart';
import 'package:dio/dio.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/video/data/datasources/remote/video_remote_data_source.dart';
import 'package:raijin/features/video/data/models/video_model.dart';

class VideoRemoteDataSourceImpl implements VideoRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<List<VideoModel>> getVideo({required String endpoint}) async {
    Response response = await dio.get('$kRaijinEndpoint/api/mirror/$endpoint');
    if (response.statusCode == 200) {
      List<VideoModel> videoModel = (response.data['data'] as List).map((e) => VideoModel.fromJson(e)).toList();

      for (int i = 0; i < videoModel.length; i++) {
        final Response mirrorResponse = await dio.get(videoModel[i].endpoint!);
        final document = parse(mirrorResponse.data);
        final mirrorEndpoint = document.getElementById('my-video')!;
        
        videoModel[i] = VideoModel(
          poster: 'https:${mirrorEndpoint.attributes['poster']}',
          endpoint: 'https:${mirrorEndpoint.attributes['data-src-url']}',
          codename: videoModel[i].codename,
          episode: videoModel[i].episode,
          part: videoModel[i].part,
          season: videoModel[i].season,
        );
      }
      return videoModel;
    }
    throw ServerFailure(message: 'Error while get video data');
  }
}
