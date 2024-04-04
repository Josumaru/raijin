import 'package:raijin/features/anime/data/models/anime_model.dart';

abstract class AnimeRemoteDataSource {
  Future<List<AnimeModel>> animeGetNew({required int page});
  Future<List<AnimeModel>> animeGet({
    required String status,
    required String order,
    required String type,
  });
  Future<AnimeModel> animeDetail({required String endpoint});
}
