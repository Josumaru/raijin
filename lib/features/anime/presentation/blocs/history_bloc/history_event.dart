part of 'history_bloc.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}


class SetHistoryEvent extends HistoryEvent{
  const SetHistoryEvent({required this.videoModel});
  final VideoModel videoModel;
}

class GetHistoryEvent extends HistoryEvent{
  const GetHistoryEvent();
}

class DeleteHistoryEvent extends HistoryEvent {
  const DeleteHistoryEvent({required this.videoEntity});
  final VideoEntity videoEntity;
}