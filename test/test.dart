import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/data/models/episode_model/episode_model.dart';
import 'package:raijin/features/anime/data/models/schedule_model/schedule_model.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';

void main() async {
  final Dio dio = Dio();


  List<VideoModel> mirrorList = [];
  List<EpisodeModel> episodeList = [];

  const endpoint = 'https://samehadaku.email/wp-json/custom/v1/all-schedule?day=sunday&type=schtml';
  final response = await dio.get(endpoint);
  final List<ScheduleModel> animeList = (response.data as List).map((e) => ScheduleModel.fromJson(e)).toList();
  // final responseBody = parse(response.data);
  // print(AnimeModel(title: title, endpoint: endpoint, poster: poster))
  print(animeList);
}
