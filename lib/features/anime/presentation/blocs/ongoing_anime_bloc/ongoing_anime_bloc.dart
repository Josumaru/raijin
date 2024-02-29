import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:raijin/features/anime/domain/entities/anime_entity.dart';
import 'package:raijin/features/anime/domain/usecases/get_anime_use_case.dart';

part 'ongoing_anime_event.dart';
part 'ongoing_anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final GetAnimeUseCase _getAnimeUseCase;
  
  AnimeBloc(this._getAnimeUseCase) : super(AnimeInitial()) {
    on<GetOngoingAnimeEvent>(onGetOngoingAnimeEvent);
  }

  void onGetOngoingAnimeEvent(GetOngoingAnimeEvent event, Emitter<AnimeState> emit) async {
    print('================Get Ongoing================');
    emit(const AnimeLoading());
    final data = await _getAnimeUseCase(status: event.status, page: event.page);
    data.fold(
      (l) => emit(AnimeFailed(message: l.toString())),
      (r) => emit(AnimeOngoingLoaded(animeEntity: r)),
    );
  }
 
}
