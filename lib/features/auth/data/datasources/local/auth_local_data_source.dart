import 'package:raijin/features/auth/data/models/auth_model.dart';
import 'package:raijin/features/auth/domain/entities/auth_entity.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser({required AuthModel authModel});
  Future<void> deleteUser();
  Future<AuthEntity> getUser();
}