import 'package:dartz/dartz.dart';
import 'package:raijin/core/errors/failure.dart';
import 'package:raijin/core/usecases/use_case.dart';
import 'package:raijin/features/auth/data/models/auth_model.dart';
import 'package:raijin/features/auth/domain/repositories/auth_repository.dart';

class AuthLoginUseCase
    extends UseCase<Either<Failure<String>, AuthModel>, AuthModel> {
  final AuthRepository authRepository;

  AuthLoginUseCase({required this.authRepository});
  @override
  Future<Either<Failure<String>, AuthModel>> call({required AuthModel? params}) async {
    return await authRepository.authLogin(authModel: params!);
  }
}
