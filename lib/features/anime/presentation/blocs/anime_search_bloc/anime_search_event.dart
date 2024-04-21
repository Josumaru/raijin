part of 'anime_search_bloc.dart';

@freezed
class AnimeSearchEvent with _$AnimeSearchEvent {
  const factory AnimeSearchEvent.animeSearchEvent({required String query}) = _AnimeSearch;
}