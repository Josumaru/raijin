// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/core/usecases/toast_usecase/toas_use_case.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_search_use_case.dart';

part 'anime_search_event.dart';
part 'anime_search_state.dart';
part 'anime_search_bloc.freezed.dart';

class AnimeSearchBloc extends Bloc<AnimeSearchEvent, AnimeSearchState> {
  final AnimeGetSearchUseCase _animeGetSearchUseCase;
  final ToastUseCase _toastUseCase;

  AnimeSearchBloc({
    required AnimeGetSearchUseCase animeGetSearchUseCase,
    required ToastUseCase toastUseCase,
  })  : _animeGetSearchUseCase = animeGetSearchUseCase,
        _toastUseCase = toastUseCase,
        super(const AnimeSearchState.initial()) {
    on<AnimeSearchEvent>((event, emit) {
      event.when(
        animeSearchEvent: (query) => _animeSearchEvent(query: query),
      );
    });
  }
  _animeSearchEvent({required String query}) async {
    emit(const AnimeSearchState.loading());
    final data = await _animeGetSearchUseCase(params: query);
    data.fold(
      (l) {
        return emit(AnimeSearchState.error(message: l.messages));
      },
      (r) {
        return emit(AnimeSearchState.loaded(animeModel: r));
      },
    );
  }
}
