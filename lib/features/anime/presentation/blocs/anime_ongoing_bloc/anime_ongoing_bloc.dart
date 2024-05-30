import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_use_case.dart';

part 'anime_ongoing_event.dart';
part 'anime_ongoing_state.dart';
part 'anime_ongoing_bloc.freezed.dart';

class AnimeOngoingBloc extends Bloc<AnimeOngoingEvent, AnimeOngoingState> {
  final AnimeGetUseCase animeGetUseCase;
  AnimeOngoingBloc({required this.animeGetUseCase})
      : super(AnimeOngoingState.started()) {
    on<AnimeOngoingEvent>((event, emit) async {
      await event.map(
        animeGetOngoing: (value) => _animeGetOngoing(
          status: value.status,
          order: value.order,
          type: value.type,
          genre: value.genre,
          page: value.page,
          emit: emit,
        ),
      );

    });
  }
  _animeGetOngoing({
    required String status,
    required String order,
    required String type,
    required String genre,
    required int page,
    required Emitter emit,
  }) async {
    emit(state.copyWith(loading: true));
    final data = await animeGetUseCase(
      order: order,
      status: status,
      type: type,
      genre: genre,
      page: page,
    );
    data.fold(
      (l) => emit(state.copyWith(error: true)),
      (r) => emit(state.copyWith(loading: false, animeModel: r)),
    );
  }
}
