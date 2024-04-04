part of 'anime_detail_bloc.dart';

@freezed
class AnimeDetailState with _$AnimeDetailState {
  const factory AnimeDetailState.initial() = _Initial;
  const factory AnimeDetailState.loading() = _Loading;
  const factory AnimeDetailState.loaded({required AnimeModel animeModel}) = _Loaded;
  const factory AnimeDetailState.error({required String message}) = _Error;
}
