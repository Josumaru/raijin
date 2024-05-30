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
        super(AnimeMoreState.started()) {
    on<AnimeMoreEvent>((event, emit) async {
      await event.map(
        animeGetMore: (value) => _animeGetMore(
          status: value.status,
          order: value.order,
          type: value.type,
          genre: value.genre,
          emit: emit,
        ),
        animeResetMore: (value) => _animeResetMore(emit: emit),
      );
    });
  }

  _animeResetMore({required Emitter emit}) {
    emit(state.copyWith(page: 1, animeList: []));
  }

  Future _animeGetMore({
    required String status,
    required String order,
    required String type,
    required String genre,
    required Emitter emit,
  }) async {
    emit(state.copyWith(loading: true));
    final data = await _animeGetMoreUseCase(
      order: order,
      status: status,
      type: type,
      genre: genre,
      page: state.page,
    );
    int page = state.page + 1;

    data.fold(
      (l) => emit(state.copyWith(loading: false, error: true)),
      (r) {
        List<AnimeModel> animeList = state.animeList.toList();
        for (var element in r.toList()) {
          animeList.add(element);
        }
        emit(state.copyWith(loading: false, animeList: animeList, page: page));
      },
    );
  }
}
