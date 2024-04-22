part of 'anime_ongoing_bloc.dart';

@freezed
class AnimeOngoingEvent with _$AnimeOngoingEvent {
  const factory AnimeOngoingEvent.animeGetOngoing({
    required String status,
    required String order,
    required String type,
    required int page,
  }) = _AnimeGet;
}