import 'package:firebase_auth/firebase_auth.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:raijin/features/auth/domain/entities/auth_entity.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AuthEntity> authRegister(String username, String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await firebaseAuth.currentUser!.updateDisplayName(username);
    } on FirebaseAuthException catch (e) {
      throw ServerFailure(message: e.toString());
    }
    
    AuthEntity authEntity = AuthEntity(
      email: firebaseAuth.currentUser!.email.toString(),
      username: firebaseAuth.currentUser!.displayName.toString(),
      password: password,
      image: firebaseAuth.currentUser!.photoURL.toString(),
      id: firebaseAuth.currentUser!.uid,
    );
    return authEntity;
  }
  
  @override
  Future<AuthEntity> authLogin(String email, String password) async {
  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    AuthEntity authEntity = AuthEntity(
      email: firebaseAuth.currentUser!.email.toString(),
      username: firebaseAuth.currentUser!.displayName.toString(),
      password: password,
      image: firebaseAuth.currentUser!.photoURL.toString(),
      id: firebaseAuth.currentUser!.uid,
    );
    return authEntity;
  }
}
