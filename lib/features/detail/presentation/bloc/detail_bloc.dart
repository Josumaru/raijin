import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:raijin/features/detail/domain/entities/detail_entity.dart';
import 'package:raijin/features/detail/domain/usecases/get_detail_use_case.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetDetailUseCase getDetailUseCase;

  DetailBloc({required this.getDetailUseCase}) : super(DetailInitial()) {
    on<GetDetailEvent>(onGetDetailEvent);
  }

  void onGetDetailEvent(GetDetailEvent event, Emitter<DetailState> emit) async {
    emit(DetailLoading());
    final data = await getDetailUseCase(endpoint: event.endpoint);
    data.fold(
      (l) => emit(DetailFailed()),
      (r) => emit(DetailLoaded(detailEntity: r)),
    );
  }
}
