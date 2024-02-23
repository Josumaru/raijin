
import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/auth/domain/entities/auth_entity.dart';
import 'package:raijin/features/auth/domain/repositories/auth_repository.dart';

class RegisterAuthUseCase {
  RegisterAuthUseCase({required this.authRepository});
  final AuthRepository authRepository;

  Future<Either<Failure, AuthEntity>> call({required String username, required  String email, required  String password}) async{
    return await authRepository.registerAuth(username, email, password);
  }
}