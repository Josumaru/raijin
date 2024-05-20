part of 'anime_preferences_bloc.dart';

@freezed
class AnimePreferencesEvent with _$AnimePreferencesEvent {
  const factory AnimePreferencesEvent.setPreferences({required UserPreferencesModel preferences}) = _SetPreferences;
  const factory AnimePreferencesEvent.getPreferences() = _GetPreferences;
}