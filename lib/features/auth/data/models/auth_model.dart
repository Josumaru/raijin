import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/features/auth/domain/entities/auth_entity.dart';
part 'auth_model.freezed.dart';

@freezed
abstract class AuthModel with _$AuthModel {
  const factory AuthModel({
    required String name,
    required String email,
    required String password,
    required String image,
    required String id,
  }) = _AuthModel;

  factory AuthModel.fromEntity({required AuthEntity authEntity}) {
    return AuthModel(
      name: authEntity.name,
      email: authEntity.email,
      id: authEntity.id,
      image: authEntity.image,
      password: authEntity.password,
    );
  }
}
