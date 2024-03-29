import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_event.dart';
part 'anime_state.dart';
part 'anime_bloc.freezed.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  AnimeBloc() : super(_Initial()) {
    on<AnimeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
