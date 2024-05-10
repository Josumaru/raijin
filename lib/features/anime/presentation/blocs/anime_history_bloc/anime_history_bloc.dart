import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'anime_history_event.dart';
part 'anime_history_state.dart';
part 'anime_history_bloc.freezed.dart';

class AnimeHistoryBloc extends Bloc<AnimeHistoryEvent, AnimeHistoryState> {
  AnimeHistoryBloc() : super(AnimeHistoryState.started()) {
    on<AnimeHistoryEvent>((event, emit) {
      event.map(
        addAnimeHistory: (value) => _addAnimeHistory(video: value.video),
        deleteAnimeHistory: (value) => _deleteAnimeHistory(),
        getAnimeHistory: (value) => _getAnimeHistory(),
      );
    });
  }
  _addAnimeHistory({required VideoModel video}) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final docRef = firestore.collection('History').doc();
    await docRef.set(video.toJson());
  }
  _deleteAnimeHistory() {}
  _getAnimeHistory() {}
}
