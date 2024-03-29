import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/core/usecases/use_case.dart';
import 'package:raijin/features/auth/domain/repositories/auth_repository.dart';

class AuthLogoutUseCase extends UseCase<Either<Failure, void>, void> {
  final AuthRepository authrepository;
  AuthLogoutUseCase({required this.authrepository});
  @override
  Future<Either<Failure, void>> call({required void params}) async {
    return await authrepository.authLogout();
  }
  
}