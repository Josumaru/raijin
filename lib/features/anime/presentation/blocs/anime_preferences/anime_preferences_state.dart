part of 'anime_preferences_bloc.dart';

@freezed
class AnimePreferencesState with _$AnimePreferencesState {
  const AnimePreferencesState._();
  const factory AnimePreferencesState({
    required bool loading,
    required bool error,
    required UserPreferencesModel preferences,
  }) = _AnimePreferencesState;

  factory AnimePreferencesState.started() {
    return const AnimePreferencesState(
      loading: false,
      error: false,
      preferences: UserPreferencesModel(
        theme: 'system',
        resolution: '4K',
        playback: 1.0,
        photoPath: '',
        username: ''
      ),
    );
  }
}
