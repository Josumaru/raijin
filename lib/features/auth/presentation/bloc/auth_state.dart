part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  // TODO
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.loaded({AuthModel? authModel}) = _Loaded;
  const factory AuthState.error({required String message}) = _Error;
}