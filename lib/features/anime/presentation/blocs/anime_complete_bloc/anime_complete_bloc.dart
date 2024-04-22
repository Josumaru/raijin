// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_use_case.dart';

part 'anime_complete_event.dart';
part 'anime_complete_state.dart';
part 'anime_complete_bloc.freezed.dart';

class AnimeCompleteBloc extends Bloc<AnimeCompleteEvent, AnimeCompleteState> {
  AnimeGetUseCase animeGetUseCase;
  AnimeCompleteBloc({
    required this.animeGetUseCase,
  }) : super(const AnimeCompleteState.initial()) {
    // Bloc for anime complete
    on<AnimeCompleteEvent>(
      (event, emit) async {
        await event.when(
          animeGetComplete: (status, order, type, page) => _animeGetComplete(
            status: status,
            order: order,
            type: type,
            page: page,
          ),
        );
      },
    );
  }
  Future _animeGetComplete({
    required String status,
    required String order,
    required String type,
    required int page,
  }) async {
    emit(const AnimeCompleteState.loading());
    final data = await animeGetUseCase(
      order: order,
      status: status,
      type: type,
      page: page,
    );
    data.fold(
      (l) => emit(AnimeCompleteState.error(message: l.toString())),
      (r) => emit(AnimeCompleteState.loaded(animeModel: r)),
    );
  }
}
