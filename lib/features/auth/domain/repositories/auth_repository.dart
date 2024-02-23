import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> loginAuth(String email, String password);
  Future<Either<Failure, AuthEntity>> registerAuth(String username, String email, String password);
}