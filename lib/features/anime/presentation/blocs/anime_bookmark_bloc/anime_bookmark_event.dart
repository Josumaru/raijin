part of 'anime_bookmark_bloc.dart';

@freezed
class AnimeBookmarkEvent with _$AnimeBookmarkEvent {
  const factory AnimeBookmarkEvent.addAnimeList({required AnimeModel anime}) = _AddAnimeList;
  const factory AnimeBookmarkEvent.removeAnimeList({required String poster}) = _RemoveAnimeList;
  const factory AnimeBookmarkEvent.getAnimeList() = _GetAnimeList;
}