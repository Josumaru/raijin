import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:raijin/features/anime/domain/usecases/delete_history_use_case.dart';
import 'package:raijin/features/anime/domain/usecases/get_history_use_case.dart';
import 'package:raijin/features/anime/domain/usecases/set_history_use_case.dart';
import 'package:raijin/features/video/data/models/video_model.dart';
import 'package:raijin/features/video/domain/entities/video_entity.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {

  final GetHistoryUseCase getHistoryUseCase;
  final SetHistoryUseCase setHistoryUseCase;
  final DeleteHistoryUseCase deleteHistoryUseCase;

  HistoryBloc({required this.deleteHistoryUseCase, required this.getHistoryUseCase, required this.setHistoryUseCase}) : super(HistoryInitial()) {
    on<SetHistoryEvent>(onSetHistoryEvent);
    on<GetHistoryEvent>(onGetHistoryEvent);
    on<DeleteHistoryEvent>(onDeleteHistoryEvent);
  }

  void onGetHistoryEvent(GetHistoryEvent event, Emitter<HistoryState> emit) async {
    emit(HistoryLoading());
    final data = await getHistoryUseCase();
    data.fold(
        (l) => emit(HistoryFailed()),
        (r) => emit(HistoryLoaded(videoEntity: r)
      )
    );
  }

  void onSetHistoryEvent(SetHistoryEvent event, Emitter<HistoryState> emit) async {
    emit(HistoryLoading());
    final data = await setHistoryUseCase(videoModel: event.videoModel);
    data.fold(
      (l) => emit(HistoryFailed()),
      (r) => emit(const HistoryLoaded())
    );
  }

  void onDeleteHistoryEvent(DeleteHistoryEvent event, Emitter<HistoryState> emit) async {
    emit(HistoryLoading());
    final data = await deleteHistoryUseCase(videoEntity: event.videoEntity);
    data.fold(
      (l) => emit(HistoryFailed()),
      (r) => emit(const HistoryLoaded()),
    );
  }
}
