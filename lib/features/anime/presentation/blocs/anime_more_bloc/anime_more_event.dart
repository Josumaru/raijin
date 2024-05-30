part of 'anime_more_bloc.dart';

@freezed
class AnimeMoreEvent with _$AnimeMoreEvent {
  const factory AnimeMoreEvent.animeResetMore() = _AnimeResetMore;
  const factory AnimeMoreEvent.animeGetMore({
    required String status,
    required String order,
    required String type,
    required String genre,
    required int page,
  }) = _AnimeGetMore;
}
