part of 'page_bloc.dart';

sealed class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}


class SetPageEvent extends PageEvent {
  final int page;
  const SetPageEvent({required this.page});
}