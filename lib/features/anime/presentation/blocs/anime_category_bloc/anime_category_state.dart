part of 'anime_category_bloc.dart';

@freezed
class AnimeCategoryState with _$AnimeCategoryState {
  const factory AnimeCategoryState({
    required bool loading,
    required bool error,
    required List<String> genreList,
  }) = _AnimeCategoryState;
  factory AnimeCategoryState.started() {
    return const AnimeCategoryState(
      loading: true,
      error: false,
      genreList: [],
    );
  }
}
