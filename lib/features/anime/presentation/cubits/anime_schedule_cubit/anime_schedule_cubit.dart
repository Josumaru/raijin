import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_schedule_state.dart';
part 'anime_schedule_cubit.freezed.dart';

class AnimeScheduleCubit extends Cubit<AnimeScheduleState> {
  AnimeScheduleCubit() : super(const AnimeScheduleState.initial());
  void select({required String day}) async {
    try {
      emit(const AnimeScheduleState.loading());
      emit(AnimeScheduleState.loaded(day: day));
    } catch (e) {
      emit(const AnimeScheduleState.loading());
      emit(AnimeScheduleState.error(message: e.toString()));
    }
  }
}
