part of 'anime_complete_bloc.dart';

@freezed
class AnimeCompleteEvent with _$AnimeCompleteEvent {
  const factory AnimeCompleteEvent.animeGetComplete({
    required String status,
    required String order,
    required String type,
    required int page,
  }) = _AnimeGetComplete;
}
