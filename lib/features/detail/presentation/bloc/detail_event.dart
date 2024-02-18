part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}


class GetDetailEvent extends DetailEvent {
  final String endpoint;
  const GetDetailEvent({required this.endpoint});
}
