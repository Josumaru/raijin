import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_genre_use_case.dart';

part 'anime_category_event.dart';
part 'anime_category_state.dart';
part 'anime_category_bloc.freezed.dart';

class AnimeCategoryBloc extends Bloc<AnimeCategoryEvent, AnimeCategoryState> {
  AnimeGetGenreUseCase animeGetGenreUseCase;
  AnimeCategoryBloc({required this.animeGetGenreUseCase})
      : super(AnimeCategoryState.started()) {
    on<AnimeCategoryEvent>((event, emit) async {
      await event.map(
        getGenre: (value) => _getGenre(emit: emit),
      );
    });
  }
  _getGenre({required Emitter emit}) async {
    emit(state.copyWith(loading: true));
    final data = await animeGetGenreUseCase();
    data.fold(
      (l) => emit(
        state.copyWith(error: true, loading: false),
      ),
      (r) => emit(state.copyWith(
        loading: false,
        genreList: r,
      )),
    );
  }
}
