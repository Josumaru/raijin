import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/auth/domain/entities/auth_entity.dart';
import 'package:raijin/features/auth/domain/repositories/auth_repository.dart';

class LoginAuthUseCase {
  const LoginAuthUseCase({required this.authRepository});
  final AuthRepository authRepository;

  Future<Either<Failure, AuthEntity>> call({required String email, required String password, required bool save}) async {
    return await authRepository.loginAuth(email, password, save);
  }
}