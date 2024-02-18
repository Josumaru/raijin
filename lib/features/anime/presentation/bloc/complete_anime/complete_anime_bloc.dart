import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:raijin/features/anime/domain/entities/anime_entity.dart';
import 'package:raijin/features/anime/domain/usecases/get_anime_use_case.dart';
import 'package:raijin/features/anime/presentation/bloc/anime/anime_bloc.dart';

part 'complete_anime_event.dart';
part 'complete_anime_state.dart';

class CompleteAnimeBloc extends Bloc<CompleteAnimeEvent, CompleteAnimeState> {

  GetAnimeUseCase _getAnimeUseCase;

  CompleteAnimeBloc(this._getAnimeUseCase) : super(CompleteAnimeInitial()) {
    on<GetCompleteAnimeEvent>(onGetCompleteAnimeEvent);
  }
    void onGetCompleteAnimeEvent(GetCompleteAnimeEvent event, Emitter<CompleteAnimeState> emit) async {
    print('================Get Complete================');
    emit(CompleteAnimeLoading());
    final data = await _getAnimeUseCase(status: event.status, page: event.page);
    data.fold(
      (l) => emit(CompleteAnimeFailed(message: l.toString())),
      (r) => emit(CompleteAnimeLoaded(animeEntity: r)),
    );
  }
}
