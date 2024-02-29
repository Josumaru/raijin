import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(const PageInitial(page: 0)) {
    on<SetPageEvent>(onSetPageEvent);
  }

  onSetPageEvent(SetPageEvent event, Emitter<PageState> emit) {
    emit(PageLoaded(page: event.page));
  }
}
