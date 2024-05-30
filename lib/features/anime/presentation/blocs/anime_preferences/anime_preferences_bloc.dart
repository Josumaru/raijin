import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/anime/data/models/user_preferences_model/user_preferences_model.dart';

part 'anime_preferences_event.dart';
part 'anime_preferences_state.dart';
part 'anime_preferences_bloc.freezed.dart';

class AnimePreferencesBloc
    extends Bloc<AnimePreferencesEvent, AnimePreferencesState> {
  final FirebaseAuth user;
  final FirebaseFirestore firestore;
  AnimePreferencesBloc({
    required this.user,
    required this.firestore,
  }) : super(AnimePreferencesState.started()) {
    on<AnimePreferencesEvent>((event, emit) async {
      await event.map(
        setPreferences: (value) => _setPreferences(
          emit: emit,
          preferences: value.preferences,
        ),
        getPreferences: (value) => _getPreferences(emit: emit),
      );
    });
  }
  _setPreferences({
    required Emitter emit,
    required UserPreferencesModel preferences,
  }) async {
    emit(state.copyWith(loading: true));
    final String uid = user.currentUser!.uid;
    final DocumentReference document = firestore.collection('users').doc(uid);
    final snapshot = await document.get();
    await user.currentUser!.updateDisplayName(preferences.username!);
    if (!snapshot.exists) {
      final query =
          document.collection('preferences').where('uid', isEqualTo: uid);
      final prefSnapshot = await query.get();
      final collection = document.collection('preferences').doc('preferences');
      if (prefSnapshot.docs.isEmpty) {
        await collection.set(preferences.toJson());
      } else {
        await collection.update(preferences.toJson());
      }
    }

    // Get data
    final collectionRef = firestore
        .collection('users')
        .doc(uid)
        .collection('preferences')
        .doc('preferences');
    final snapshots = await collectionRef.get();
    final UserPreferencesModel preferencess =
        UserPreferencesModel.fromJson(snapshots.data()!);
    emit(
      state.copyWith(
        loading: false,
        preferences: preferencess,
      ),
    );
  }

  _getPreferences({required Emitter emit}) async {
    final String uid = user.currentUser!.uid;

    emit(state.copyWith(loading: true));
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final collectionRef = firestore
        .collection('users')
        .doc(uid)
        .collection('preferences')
        .doc('preferences');
    final snapshot = await collectionRef.get();
    if (snapshot.exists) {
      final UserPreferencesModel preferences =
          UserPreferencesModel.fromJson(snapshot.data()!);
      emit(
        state.copyWith(
          loading: false,
          preferences: preferences,
        ),
      );
    } else {
      emit(state.copyWith(loading: false));
    }
  }
}
