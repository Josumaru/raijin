import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:raijin/features/auth/data/models/auth_model.dart';
import 'package:raijin/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure<String>, AuthModel>> authLogin(
      {required AuthModel authModel}) async {
    try {
      final AuthModel r =
          await authRemoteDataSource.authLogin(authModel: authModel);
      return Right(r);
    } catch (e) {
      if (e is FirebaseException) {
        final String message = e.code.replaceAll('-', ' ').toUpperCase();
        return Left(Failure.unauthorizedError(message: message));
      }
      return Left(
        const Failure.unauthorizedError(message: 'Ups! Try again later!'),
      );
    }
  }

  @override
  Future<Either<Failure<String>, void>> authLogout() async {
    try {
      final r = await authRemoteDataSource.authLogout();
      return Right(r);
    } catch (e) {
      return Left(Failure.unauthorizedError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure<String>, AuthModel>> authRegister(
      {required AuthModel authModel}) async {
    try {
      final data =
          await authRemoteDataSource.authRegister(authModel: authModel);
      return Right(data);
    } catch (e) {
      if (e is FirebaseException) {
        String message = e.code.replaceAll('-', ' ').toUpperCase();
        return Left(Failure.unauthorizedError(message: message));
      }
    }
    return Left(
        const Failure.unauthorizedError(message: 'Ups! Try again later!'));
  }
}
