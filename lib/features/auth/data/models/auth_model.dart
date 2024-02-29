import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:raijin/features/auth/domain/entities/auth_entity.dart';
part 'auth_model.g.dart';

@HiveType(typeId: 0)
class AuthModel extends Equatable {
  const AuthModel({
    @HiveField(0)
    this.email,
    @HiveField(1)
    this.username,
    @HiveField(2)
    this.password,
    @HiveField(3)
    this.image,
    @HiveField(4)
    this.id,
  });

  final String? email, password, username, image, id;

  @override
  List<Object?> get props => [
    email,
    password,
    username,
    username,
    id,
  ];

  AuthModel fromEntity(AuthEntity authEntity) {
    return AuthModel(
      email: authEntity.email,
      id: authEntity.id,
      image: authEntity.image,
      password: authEntity.password,
      username: authEntity.username,
    );
  }
  AuthEntity toEntity(AuthModel authModel) {
    return AuthEntity(
      email: authModel.email.toString(),
      username: authModel.username.toString(),
      password: authModel.password.toString(),
      image: authModel.image.toString(),
      id: authModel.id.toString(),
      );
  }
}