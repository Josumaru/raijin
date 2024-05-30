import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/video_model/video_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'anime_history_event.dart';
part 'anime_history_state.dart';
part 'anime_history_bloc.freezed.dart';

class AnimeHistoryBloc extends Bloc<AnimeHistoryEvent, AnimeHistoryState> {
  final FirebaseAuth user;
  final FirebaseFirestore firestore;

  AnimeHistoryBloc({required this.firestore, required this.user})
      : super(AnimeHistoryState.started()) {
    on<AnimeHistoryEvent>((event, emit) async {
      await event.map(
        addAnimeHistory: (value) => _addAnimeHistory(video: value.video),
        deleteAnimeHistory: (value) =>
            _deleteAnimeHistory(baseUrl: value.endpoint),
        getAnimeHistory: (value) => _getAnimeHistory(emit: emit),
      );
    });
  }
  _addAnimeHistory({required VideoModel video}) async {
    final String uid = user.currentUser!.uid;

    final DocumentReference document = firestore.collection('history').doc(uid);

    final snapshot = await document.get();

    if (!snapshot.exists) {
      // Create a query to find documents with matching baseUrl
      final query = document.collection('historyList').where(
            'endpoint',
            isEqualTo: video.endpoint,
          );
      final snapshot = await query.get();
      final collection = document.collection('historyList').doc(video.endpoint);
      if (snapshot.docs.isEmpty) {
        await collection.set(video.toJson());
      } else {
        await collection.update(video.toJson());
      }
    }
  }

  Future<void> _deleteAnimeHistory({required String baseUrl}) async {
    final String uid = user.currentUser!.uid;

    // Get a reference to the user's history document
    final DocumentReference userDocRef =
        firestore.collection('history').doc(uid);

    // Get a reference to the video history collection
    final CollectionReference videoHistoryRef =
        userDocRef.collection('historyList');

    // Delete the specific video document based on videoId (replace with your logic)
    await videoHistoryRef.doc(baseUrl).delete();
  }

  _getAnimeHistory({required Emitter emit}) async {
    emit(state.copyWith(loading: true));
    final String uid = user.currentUser!.uid;

    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final collectionRef = firestore
        .collection('history')
        .doc(uid)
        .collection('historyList')
        .orderBy('timestamp', descending: true);
    final snapshot = await collectionRef.get();
    final List<VideoModel> videoList =
        snapshot.docs.map((e) => VideoModel.fromJson(e.data())).toList();
    emit(state.copyWith(
      loading: false,
      videoList: videoList,
    ));
  }
}
