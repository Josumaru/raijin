part of 'anime_bloc.dart';

@freezed
class AnimeEvent with _$AnimeEvent {
  const factory AnimeEvent.animeGetNew({required int page}) = _AnimeGetNew;
}