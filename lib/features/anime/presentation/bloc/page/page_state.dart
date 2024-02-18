part of 'page_bloc.dart';

sealed class PageState extends Equatable {
  const PageState({required this.page});
  final int? page;
  @override
  List<Object> get props => [page!];
}

final class PageInitial extends PageState {
  const PageInitial({required super.page});
}

final class PageLoading extends PageState {
  const PageLoading({required super.page});
}

final class PageLoaded extends PageState {
  @override
  // ignore: overridden_fields
  final int page;
  const PageLoaded({required this.page}) : super(page: 0);
}

final class PageFailed extends PageState {
  final String message;
  const PageFailed({required this.message, required super.page});
}
