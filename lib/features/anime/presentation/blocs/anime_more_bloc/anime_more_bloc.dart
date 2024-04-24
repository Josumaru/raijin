// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_more_use_case.dart';

part 'anime_more_event.dart';
part 'anime_more_state.dart';
part 'anime_more_bloc.freezed.dart';

class AnimeMoreBloc extends Bloc<AnimeMoreEvent, AnimeMoreState> {
  final AnimeGetMoreUseCase _animeGetMoreUseCase;
  AnimeMoreBloc({required AnimeGetMoreUseCase animeGetMoreUseCase})
      : _animeGetMoreUseCase = animeGetMoreUseCase,
        super(const AnimeMoreState.initial()) {
    on<AnimeMoreEvent>((event, emit) async {
      await event.when(
        animeGetMore: (status, order, type, genre, page) => _animeGetMore(
          status: status,
          order: order,
          type: type,
          genre: genre,
          page: page,
        ),
      );
    });
  }
  Future _animeGetMore({
    required String status,
    required String order,
    required String type,
    required String genre,
    required int page,
  }) async {
    emit(const AnimeMoreState.loading());
    final data = await _animeGetMoreUseCase(
      order: order,
      status: status,
      type: type,
      genre: genre,
      page: page,
    );
    data.fold(
      (l) => emit(AnimeMoreState.error(message: l.toString())),
      (r) => emit(AnimeMoreState.loaded(animeModel: r)),
    );
  }
}
