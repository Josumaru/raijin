import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/data/models/schedule_model/schedule_model.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';

abstract class AnimeRepository {
  Future<Either<Failure<String>, List<AnimeModel>>> getNewAnime({
    required int page,
  });
  Future<Either<Failure<String>, List<AnimeModel>>> animeGet({
    required String status,
    required String order,
    required String type,
    required String genre,
    required int page,
  });
  Future<Either<Failure<String>, AnimeModel>> animeGetDetail({
    required String endpoint,
  });
  Future<Either<Failure<String>, List<VideoModel>>> animeGetVideo({
    required String endpoint,
    required String baseUrl,
  });
  Future<Either<Failure<String>, List<ScheduleModel>>> animeGetSchedule({
    required String day,
  });
  Future<Either<Failure<String>, List<AnimeModel>>> animeGetSearch({
    required String query,
  });
}
