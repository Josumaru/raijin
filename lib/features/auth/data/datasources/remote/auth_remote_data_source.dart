import 'package:raijin/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRemoteDataSource {
  Future<AuthEntity> authRegister(String username, String email, String password);
  Future<AuthEntity> authLogin(String email, String password);
  Future<void > authLogOut();
}