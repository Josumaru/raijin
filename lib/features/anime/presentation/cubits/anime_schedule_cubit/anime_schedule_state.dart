part of 'anime_schedule_cubit.dart';

@freezed
class AnimeScheduleState with _$AnimeScheduleState {
  const factory AnimeScheduleState.initial() = _Initial;
  const factory AnimeScheduleState.loading() = _Loading;
  const factory AnimeScheduleState.loaded({required String day}) = _Loaded;
  const factory AnimeScheduleState.error({required String message}) = _Error;
}
