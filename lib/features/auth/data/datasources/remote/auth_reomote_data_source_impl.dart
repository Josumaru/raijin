import 'package:firebase_auth/firebase_auth.dart';
import 'package:raijin/features/anime/data/models/user_preferences_model/user_preferences_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_preferences/anime_preferences_bloc.dart';
import 'package:raijin/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:raijin/features/auth/data/models/auth_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final AnimePreferencesBloc _animePreferencesBloc;
  AuthRemoteDataSourceImpl(
      {required FirebaseAuth firebaseAuth,
      required AnimePreferencesBloc animePreferencesBloc})
      : _firebaseAuth = firebaseAuth,
        _animePreferencesBloc = animePreferencesBloc;

  @override
  Future<AuthModel> authLogin({required AuthModel authModel}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: authModel.email,
      password: authModel.password,
    );
    final currentUser = _firebaseAuth.currentUser!;

    return AuthModel(
      name: currentUser.displayName ?? '',
      email: currentUser.email ?? '',
      password: '',
      image: currentUser.photoURL ?? '',
      id: currentUser.uid,
    );
  }

  @override
  Future<void> authLogout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<AuthModel> authRegister({required AuthModel authModel}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: authModel.email,
      password: authModel.password,
    );

    await _firebaseAuth.currentUser!.updateDisplayName(authModel.name);
    final currentUser = _firebaseAuth.currentUser!;
    final UserPreferencesModel preferences = UserPreferencesModel(
      photoPath: '',
      playback: 1,
      resolution: '4K',
      theme: 'system',
      server: 'pixeldrain',
      username: currentUser.displayName,
    );
    _animePreferencesBloc.add(
      AnimePreferencesEvent.setPreferences(
        preferences: preferences,
      ),
    );

    return AuthModel(
      name: currentUser.displayName ?? '',
      email: currentUser.email ?? '',
      password: '',
      image: currentUser.photoURL ?? '',
      id: currentUser.uid,
    );
  }
}
