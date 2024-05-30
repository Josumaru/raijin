// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/schedule_model/schedule_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_schedule_use_case.dart';

part 'anime_schedule_event.dart';
part 'anime_schedule_state.dart';
part 'anime_schedule_bloc.freezed.dart';

class AnimeScheduleBloc extends Bloc<AnimeScheduleEvent, AnimeScheduleState> {
  final AnimeGetScheduleUseCase _animeGetScheduleUseCase;
  AnimeScheduleBloc({
    required AnimeGetScheduleUseCase animeGetScheduleUseCase,
  })  : _animeGetScheduleUseCase = animeGetScheduleUseCase,
        super(const AnimeScheduleState.initial()) {
    on<AnimeScheduleEvent>((event, emit) {
      event.when(
        animeGetSchedule: (day) => _animeGetSchedule(day: day),
      );
    });
  }
  _animeGetSchedule({required String day}) async {
    emit(const AnimeScheduleState.loading());
    final data = await _animeGetScheduleUseCase(params: day);
    data.fold(
      (l) {
        return emit(AnimeScheduleState.error(message: l.messages));
      },
      (r) {
        return emit(AnimeScheduleState.loaded(scheduleModel: r, day: day));
      },
    );
  }
}
