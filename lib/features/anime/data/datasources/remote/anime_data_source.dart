import 'package:raijin/features/anime/data/models/anime_model.dart';

abstract class AnimeRemoteDataSource {
  Future<List<AnimeModel>> animeGetNew({required String page});
}