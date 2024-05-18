import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/features/anime/data/models/anime_model/anime_model.dart';

part 'anime_bookmark_event.dart';
part 'anime_bookmark_state.dart';
part 'anime_bookmark_bloc.freezed.dart';

class AnimeBookmarkBloc extends Bloc<AnimeBookmarkEvent, AnimeBookmarkState> {
  final FirebaseFirestore firestore;
  final String uid = sl<FirebaseAuth>().currentUser!.uid;

  AnimeBookmarkBloc({required this.firestore})
      : super(AnimeBookmarkState.started()) {
    on<AnimeBookmarkEvent>((event, emit) async {
      await event.map(
        addAnimeList: (value) => _addAnimeList(value.anime),
        removeAnimeList: (value) => _removeAnimeList(),
        getAnimeList: (value) => _getAnimeList(emit: emit),
      );
    });
  }
  _addAnimeList(AnimeModel anime) async {
    final DocumentReference document =
        firestore.collection('bookmark').doc(uid);

    final snapshot = await document.get();

    if (!snapshot.exists) {
      // Create a query to find documents with matching baseUrl
      final query = document.collection('bookmarkList').where(
            'endpoint',
            isEqualTo: anime.endpoint,
          );
      final snapshot = await query.get();
      final collection =
          document.collection('bookmarkList').doc(anime.endpoint);
      if (snapshot.docs.isEmpty) {
        await collection.set(anime.toJson());
      }
    }
  }

  _removeAnimeList() {}
  _getAnimeList({required Emitter emit}) async {
    emit(state.copyWith(loading: true));
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final collectionRef =
        firestore.collection('bookmark').doc(uid).collection('bookmarkList');
    final snapshot = await collectionRef.get();
    final List<AnimeModel> animeList =
        snapshot.docs.map((e) => AnimeModel.fromJson(e.data())).toList();
    emit(state.copyWith(
      loading: false,
      animeList: animeList,
    ));
  }
}
