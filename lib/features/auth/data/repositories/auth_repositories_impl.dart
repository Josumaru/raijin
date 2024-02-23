import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:raijin/features/auth/domain/entities/auth_entity.dart';
import 'package:raijin/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.authRemoteDataSource});
  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<Either<Failure, AuthEntity>> loginAuth(String email, String password) async {
    try {
      final AuthEntity authEntity = await authRemoteDataSource.authLogin(email, password);
      return Right(authEntity);
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, AuthEntity>> registerAuth(String username, String email, String password) async {
    try {
      final AuthEntity authEntity = await authRemoteDataSource.authRegister(username, email, password);
      print(authEntity);
      return Right(authEntity);
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
