part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
  const DetailState();
  
  @override
  List<Object> get props => [];
}

final class DetailInitial extends DetailState {}

final class DetailLoading extends DetailState {}

final class DetailLoaded extends DetailState {
  final DetailEntity detailEntity;
  const DetailLoaded({required this.detailEntity});
}

final class DetailFailed extends DetailState {}
