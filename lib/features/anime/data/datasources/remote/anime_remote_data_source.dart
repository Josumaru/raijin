import 'package:raijin/features/anime/data/models/anime_model.dart';

abstract class AnimeRemoteDataSource {
  Future<List<AnimeModel>> getAnime({required String status, required int page});
}