import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';

@freezed
abstract class AuthEntity with _$AuthEntity{
  const factory AuthEntity({
    required String name,
    required String email,
    required String password,
    required String image,
    required String id,
  }) = _AuthEntity;
}
