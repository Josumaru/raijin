import 'package:raijin/features/auth/data/models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> authRegister({required AuthModel authModel});
  Future<AuthModel> authLogin({required AuthModel authModel});
  Future<void> authLogout();
}