part of 'complete_anime_bloc.dart';

sealed class CompleteAnimeState extends Equatable {
  const CompleteAnimeState();
  
  @override
  List<Object> get props => [];
}

final class CompleteAnimeInitial extends CompleteAnimeState {}

final class CompleteAnimeLoading extends CompleteAnimeState {}

final class CompleteAnimeLoaded extends CompleteAnimeState {
  final List<AnimeEntity> animeEntity;
  const CompleteAnimeLoaded({required this.animeEntity});
}


final class CompleteAnimeFailed extends CompleteAnimeState {
  final String message;
  const CompleteAnimeFailed({required this.message});
}