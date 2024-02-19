import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String email;
  final String password;
  final String id;

  const AuthEntity({
    required this.email,
    required this.password,
    required this.id,
  });

  static const empty = AuthEntity(
    email: '',
    password: '',
    id: '',
  );

  AuthEntity copyWith({
    String? email,
    String? password,
    String? id,
  }) {
    return AuthEntity(
      email: email ?? this.email,
      password: password ?? this.password,
      id: id ?? this.id,
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(
      email: email,
      password: password,
      id: id,
    );
  }

  @override
  List<Object?> get props => [id, email, password];
}
