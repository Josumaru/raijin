part of 'ongoing_anime_bloc.dart';

sealed class AnimeState extends Equatable {
  const AnimeState();
  
  @override
  List<Object> get props => [];
}

final class AnimeInitial extends AnimeState {}


final class AnimeLoading extends AnimeState {
  const AnimeLoading();
}

final class AnimeOngoingLoaded extends AnimeState {
  final List<AnimeEntity> animeEntity;
  const AnimeOngoingLoaded({required this.animeEntity});
}


final class AnimeFailed extends AnimeState {
  final String message;
  const AnimeFailed({required this.message});
}