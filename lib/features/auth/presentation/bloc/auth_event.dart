part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authLogin({
    required AuthModel authModel,
  }) = _AuthLogin;
  const factory AuthEvent.authLogout() = _AuthLogout;
  const factory AuthEvent.authregister({
    required AuthModel authModel,
  }) = _AuthRegister;
}
