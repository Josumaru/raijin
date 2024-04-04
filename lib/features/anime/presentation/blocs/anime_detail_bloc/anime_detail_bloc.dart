// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/anime_model.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_detail_use_case.dart';

part 'anime_detail_event.dart';
part 'anime_detail_state.dart';
part 'anime_detail_bloc.freezed.dart';

class AnimeDetailBloc extends Bloc<AnimeDetailEvent, AnimeDetailState> {
  AnimeGetDetailUseCase animeGetDetailUseCase;
  AnimeDetailBloc({required this.animeGetDetailUseCase})
      : super(const AnimeDetailState.initial()) {
    on<AnimeDetailEvent>((event, emit) {
      event.map(
        animeGetDetail: (value) => _animeGetDetail(endpoint: event.endpoint),
      );
    });
  }
  _animeGetDetail({required String endpoint}) async {
    emit(const AnimeDetailState.loading());
    final data = await animeGetDetailUseCase(params: endpoint);
    data.fold(
      (l) => emit(AnimeDetailState.error(message: l.messages)),
      (r) => emit(AnimeDetailState.loaded(animeModel: r)),
    );
  }
}
