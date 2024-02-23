import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  const AuthModel({
    required this.email,
    required this.username,
    required this.password,
    required this.image,
    required this.id,
  });

  final String email, password, username, image, id;

  @override
  List<Object?> get props => [
    email,
    password,
    username,
    username,
    id,
  ];
}