// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_use_case.dart';

part 'anime_ongoing_event.dart';
part 'anime_ongoing_state.dart';
part 'anime_ongoing_bloc.freezed.dart';

class AnimeOngoingBloc extends Bloc<AnimeOngoingEvent, AnimeOngoingState> {
  final AnimeGetUseCase animeGetUseCase;
  AnimeOngoingBloc({required this.animeGetUseCase})
      : super(const AnimeOngoingState.initial()) {
    on<AnimeOngoingEvent>((event, emit) {
      event.when(
        animeGetOngoing: (status, order, type) => _animeGetPopular(
          status: status,
          order: order,
          type: type,
        ),
      );
    });
  }
  Future _animeGetPopular({
    required String status,
    required String order,
    required String type,
  }) async {
    emit(const AnimeOngoingState.loading());
    final data = await animeGetUseCase(
      order: order,
      status: status,
      type: type,
    );
    data.fold(
      (l) => emit(AnimeOngoingState.error(message: l.toString())),
      (r) => emit(AnimeOngoingState.loaded(animeModel: r)),
    );
  }
}