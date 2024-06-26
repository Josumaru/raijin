import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/data/models/schedule_model/schedule_model.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';

abstract class AnimeRemoteDataSource {
  Future<List<AnimeModel>> animeGetNew({required int page});
  Future<List<AnimeModel>> animeGet({
    required String status,
    required String order,
    required String type,
    required String genre,
    required int page,
  });
  Future<AnimeModel> animeDetail({required String endpoint});
  Future<List<VideoModel>> animeVideo({required String endpoint, required String baseUrl, required int position, required String server});
  Future<List<ScheduleModel>> animeSchedule({required String day});
  Future<List<AnimeModel>> animeSearch({required String query});
  Future<List<DownloadTask>> animeGetDownload();
  Future<List<String>> animeGetGenre();
}
