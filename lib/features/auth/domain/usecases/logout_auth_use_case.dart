import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/auth/domain/repositories/auth_repository.dart';

class LogoutAuthUseCase {
  final AuthRepository authRepository;
  const LogoutAuthUseCase({required this.authRepository});

  Future<Either<Failure, void>> call() async {
    return await authRepository.logOutAuth();
  }
}