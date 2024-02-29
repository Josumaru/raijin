part of 'history_bloc.dart';

sealed class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistoryLoaded extends HistoryState {
  final List<VideoEntity>? videoEntity;
  const HistoryLoaded({this.videoEntity});
  @override
  List<Object> get props => [videoEntity!];
}

final class HistoryFailed extends HistoryState {}
