part of 'anime_history_bloc.dart';

@freezed
class AnimeHistoryEvent with _$AnimeHistoryEvent {
  const factory AnimeHistoryEvent.addAnimeHistory({required VideoModel video}) = _AddAnimeHistory;
  const factory AnimeHistoryEvent.deleteAnimeHistory({required String endpoint}) = _DeleteAnimeHistory;
  const factory AnimeHistoryEvent.getAnimeHistory() = _GetAnimeHistory;
}