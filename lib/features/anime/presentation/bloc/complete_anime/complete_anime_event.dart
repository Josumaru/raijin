part of 'complete_anime_bloc.dart';

sealed class CompleteAnimeEvent extends Equatable {
  const CompleteAnimeEvent();

  @override
  List<Object> get props => [];
}
class GetCompleteAnimeEvent extends CompleteAnimeEvent {
  final String status;
  final int page;
  const GetCompleteAnimeEvent({required this.page, required this.status});
}