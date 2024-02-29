import 'package:dio/dio.dart';
import 'package:raijin/core/constants/constants.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_remote_data_source.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';

class AnimeRemoteDataSourceImpl implements AnimeRemoteDataSource {
  final Dio dio;
  AnimeRemoteDataSourceImpl({required this.dio});

  @override
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
