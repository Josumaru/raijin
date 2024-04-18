part of 'anime_schedule_bloc.dart';

@freezed
class AnimeScheduleState with _$AnimeScheduleState {
  const factory AnimeScheduleState.initial() = _Initial;
  const factory AnimeScheduleState.loading() = _Loading;
  const factory AnimeScheduleState.loaded({required List<ScheduleModel> scheduleModel, required String day}) = _Loaded;
  const factory AnimeScheduleState.error({required String message}) = _Error;
}
