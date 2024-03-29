import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/auth/data/models/auth_model.dart';

abstract class AuthRepository {
  Future<Either<Failure<String>, AuthModel>> authLogin({
    required AuthModel authModel,
  });

  Future<Either<Failure<String>, void>> authLogout();

  Future<Either<Failure<String>, AuthModel>> authRegister({
    required AuthModel authModel,
  });
}
