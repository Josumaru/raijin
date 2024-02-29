import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:raijin/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:raijin/features/auth/data/models/auth_model.dart';
import 'package:raijin/features/auth/domain/entities/auth_entity.dart';
import 'package:raijin/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.authRemoteDataSource, required this.authLocalDataSource});
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  @override
  Future<Either<Failure, AuthEntity>> loginAuth(String email, String password, bool save) async {
    try {
      final AuthEntity authEntity = await authRemoteDataSource.authLogin(email, password);
      print('======${authEntity} enitty');
      save ? saveUser(authEntity: authEntity) : null;
      print('===========save ${save} save============');
      final user = sl<Box<AuthModel>>().get('user');
      print('Sl-user $user');
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
      saveUser(authEntity: authEntity);
      return Right(authEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  
  @override
  Future<Either<Failure, void>> logOutAuth() async {
    try {
      await authLocalDataSource.deleteUser();
      await authRemoteDataSource.authLogOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  void saveUser({required AuthEntity authEntity}) async {
    await authLocalDataSource.saveUser(authModel: AuthModel(
        email: authEntity.email,
        id: authEntity.id,
        image: authEntity.image,
        password: authEntity.password,
        username: authEntity.username,
      )
    );
  }
}

