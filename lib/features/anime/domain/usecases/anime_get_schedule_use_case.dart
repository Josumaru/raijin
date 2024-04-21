import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/core/usecases/use_case.dart';
import 'package:raijin/features/anime/data/models/schedule_model/schedule_model.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';

class AnimeGetScheduleUseCase
    extends UseCase<Either<Failure<String>, List<ScheduleModel>>, String> {
  AnimeGetScheduleUseCase({
    required AnimeRepository animeRepository,
  }) : _animeRepository = animeRepository;
  final AnimeRepository _animeRepository;

  @override
  Future<Either<Failure<String>, List<ScheduleModel>>> call(
      {required String? params}) async {
    return await _animeRepository.animeGetSchedule(day: params!);
  }
}
