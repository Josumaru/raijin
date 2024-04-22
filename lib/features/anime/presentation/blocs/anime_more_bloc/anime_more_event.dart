part of 'anime_more_bloc.dart';

@freezed
class AnimeMoreEvent with _$AnimeMoreEvent {
  const factory AnimeMoreEvent.animeGetMore({
    required String status,
    required String order,
    required String type,
    required int page,
  }) = _AnimeGetMore;
}