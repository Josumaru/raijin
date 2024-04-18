import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';

part 'anime_discover_event.dart';
part 'anime_discover_state.dart';
part 'anime_discover_bloc.freezed.dart';

class AnimeDiscoverBloc extends Bloc<AnimeDiscoverEvent, AnimeDiscoverState> {
  AnimeDiscoverBloc() : super(const AnimeDiscoverState.initial()) {
    on<AnimeDiscoverEvent>((event, emit) {
      event.when(
        animeGetDiscover: (status, order, type) => () {},
      );
    });
  }
}
