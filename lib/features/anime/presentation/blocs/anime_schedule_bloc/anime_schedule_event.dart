part of 'anime_schedule_bloc.dart';

@freezed
class AnimeScheduleEvent with _$AnimeScheduleEvent {
  const factory AnimeScheduleEvent.animeGetSchedule({required String day}) = _AnimeGetSchedule;
}