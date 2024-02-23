part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState({this.authEntity});
  final AuthEntity? authEntity;
  
  @override
  List<Object> get props => [
    authEntity!,
  ];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  const AuthLoaded({required super.authEntity});
}

final class AuthFailed extends AuthState {}