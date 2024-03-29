import 'package:firebase_auth/firebase_auth.dart';
import 'package:raijin/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:raijin/features/auth/data/models/auth_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<AuthModel> authLogin({required AuthModel authModel}) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: authModel.email,
      password: authModel.password,
    );
    final currentUser = firebaseAuth.currentUser!;

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
    await firebaseAuth.signOut();
  }

  @override
  Future<AuthModel> authRegister({required AuthModel authModel}) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: authModel.email,
      password: authModel.password,
    );

    await firebaseAuth.currentUser!.updateDisplayName(authModel.name);
    final currentUser = firebaseAuth.currentUser!;
    return AuthModel(
      name: currentUser.displayName ?? '',
      email: currentUser.email ?? '',
      password: '',
      image: currentUser.photoURL ?? '',
      id: currentUser.uid,
    );
  }
}
