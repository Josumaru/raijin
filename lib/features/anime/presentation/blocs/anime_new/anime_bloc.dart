// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_new_use_case.dart';

part 'anime_event.dart';
part 'anime_state.dart';
part 'anime_bloc.freezed.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final AnimeGetNewUseCase animeGetNewUseCase;
  AnimeBloc({
    required this.animeGetNewUseCase,
  }) : super(const AnimeState.initial()) {
    on<AnimeEvent>((event, emit) async {
      await event.when(
        animeGetNew: (page) async => await _animeGetNew(page: page),
      );
    });
  }
  Future _animeGetNew({required int page}) async {
    emit(const AnimeState.loading());
    final data = await animeGetNewUseCase(params: page);
    data.fold(
      (l) => emit(AnimeState.error(message: l.toString())),
      (r) => emit(AnimeState.loaded(animeModel: r)),
    );
  }
}
