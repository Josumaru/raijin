import 'package:dio/dio.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_remote_data_source.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';

class AnimeRemoteDataSourceImpl implements AnimeRemoteDataSource {
  final Dio dio = Dio();

  // @override
  // Future<List<AnimeModel>> getCompleteAnime() async {
  //   List<AnimeModel> animeModel = await getAnime('complete', 1);
  //   return animeModel;
  // }

  // @override
  // Future<List<AnimeModel>> getOngoingAnime() async {
  //   List<AnimeModel> animeModel = await getAnime('ongoing', 1);
  //   return animeModel;
  // }

  // @override
  // Future<List<AnimeModel>> getDetailAnime() async {
  //   List<AnimeModel> animeModel = await getAnime('f', 1);
  //   return animeModel;
  // }


  Future<List<AnimeModel>> getAnime({required String status, required int page}) async {
    Response response = await dio.get('$kRaijinEndpoint/api/anime/$status/$page');
    if (response.statusCode == 200) {
      final List<AnimeModel> animeModel = (response.data['data'] as List).map((e) => AnimeModel.fromJson(e)).toList();
      return animeModel;
    } else {
      throw ServerFailure(message: 'Error');
    }
  }
}
