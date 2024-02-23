part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent({required this.username, required this.email, required this.password, required this.auth});
  final String username, email, password, auth;

  @override
  List<Object> get props => [];
}

class UserAuthEvent extends AuthEvent{
  const UserAuthEvent({required super.username, required super.email, required super.password, required super.auth});
}


// class RegisterAuthEvent extends AuthEvent{
//   final String username, email, password;
//   const RegisterAuthEvent({required this.username, required this.email, required this.password});
// }

// class LoginAuthEvent extends AuthEvent{
//   final String username, email, password;
//   const LoginAuthEvent({required this.username, required this.email, required this.password});
// }