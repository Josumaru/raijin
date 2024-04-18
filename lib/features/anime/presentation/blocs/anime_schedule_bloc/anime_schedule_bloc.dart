// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/core/usecases/toast_usecase/toas_use_case.dart';
import 'package:raijin/features/anime/data/models/schedule_model/schedule_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_schedule_use_case.dart';

part 'anime_schedule_event.dart';
part 'anime_schedule_state.dart';
part 'anime_schedule_bloc.freezed.dart';

class AnimeScheduleBloc extends Bloc<AnimeScheduleEvent, AnimeScheduleState> {
  final AnimeGetScheduleUseCase _animeGetScheduleUseCase;
  final ToastUseCase _toastUseCase;
  AnimeScheduleBloc({
    required AnimeGetScheduleUseCase animeGetScheduleUseCase,
    required ToastUseCase toastUseCase,
  })  : _animeGetScheduleUseCase = animeGetScheduleUseCase,
        _toastUseCase = toastUseCase,
        super(const AnimeScheduleState.initial()) {
    on<AnimeScheduleEvent>((event, emit) {
      event.when(
        animeGetSchedule: (day) => _animeGetSchedule(day: day),
      );
    });
  }
  _animeGetSchedule({required String day}) async {
    _toastUseCase(params: 'Please wait');
    emit(const AnimeScheduleState.loading());
    final data = await _animeGetScheduleUseCase(params: day);
    data.fold(
      (l) {
        _toastUseCase(params: l.messages);
        return emit(AnimeScheduleState.error(message: l.messages));
      },
      (r) {
        _toastUseCase(params: 'Schedule Loaded');
        return emit(AnimeScheduleState.loaded(scheduleModel: r, day: day));
      },
    );
  }
}
