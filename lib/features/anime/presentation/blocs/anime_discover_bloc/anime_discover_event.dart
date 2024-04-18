part of 'anime_discover_bloc.dart';

@freezed
class AnimeDiscoverEvent with _$AnimeDiscoverEvent {
    const factory AnimeDiscoverEvent.animeGetDiscover({
    required String status,
    required String order,
    required String type,
  }) = _AnimeGetDiscover;

}