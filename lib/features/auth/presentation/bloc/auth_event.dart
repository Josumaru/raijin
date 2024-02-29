part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent({this.username, this.email, this.password, this.auth, this.save});
  final String? username, email, password, auth;
  final bool? save;

  @override
  List<Object> get props => [];
}

class UserAuthEvent extends AuthEvent{
  const UserAuthEvent({super.username, super.email, super.password, super.auth, super.save});
}