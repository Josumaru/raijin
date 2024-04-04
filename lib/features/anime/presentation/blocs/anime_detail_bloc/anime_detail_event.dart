part of 'anime_detail_bloc.dart';

@freezed
class AnimeDetailEvent with _$AnimeDetailEvent {
  const factory AnimeDetailEvent.animeGetDetail({required String endpoint}) = _AnimeGetDetail;
}