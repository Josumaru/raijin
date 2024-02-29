part of 'ongoing_anime_bloc.dart';

sealed class AnimeEvent extends Equatable {
  const AnimeEvent();

  @override
  List<Object> get props => [];
}

class GetOngoingAnimeEvent extends AnimeEvent {
  final String status;
  final int page;
  const GetOngoingAnimeEvent({required this.page, required this.status});
}

