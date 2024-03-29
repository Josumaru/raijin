// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raijin/core/usecases/toast_usecase/toas_use_case.dart';
import 'package:raijin/features/auth/data/models/auth_model.dart';
import 'package:raijin/features/auth/domain/usecases/auth_login_use_case.dart';
import 'package:raijin/features/auth/domain/usecases/auth_logout_use_case.dart';
import 'package:raijin/features/auth/domain/usecases/auth_register_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthLoginUseCase authLoginUseCase;
  final AuthLogoutUseCase authLogoutUseCase;
  final AuthRegisterUseCase authRegisterUseCase;
  final ToastUseCase toastUseCase;
  AuthBloc({
    required this.authLoginUseCase,
    required this.authLogoutUseCase,
    required this.authRegisterUseCase,
    required this.toastUseCase,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>(
      (event, emit) async {
        await event.when(
          authLogin: (value) async => await _authLogin(
            authModel: value,
          ),
          authLogout: () async => await _authLogout(),
          authregister: (value) async => await _authRegister(
            authModel: value,
          ),
        );
      },
    );
  }
  Future _authLogin({required AuthModel authModel}) async {
    emit(const AuthState.loading());
    final data = await authLoginUseCase(params: authModel);
    data.fold((l) {
      toastUseCase(params: l.messages);
      emit(AuthState.error(message: l.messages));
    }, (r) {
      toastUseCase(params: 'Welcome back, ${r.name}!');
      emit(AuthState.loaded(authModel: r));
    });
  }

  _authLogout() async {
    emit(const AuthState.loading());
    final data = await authLogoutUseCase(params: null);
    data.fold(
      (l) {
        toastUseCase(params: l.messages);
        emit(AuthState.error(message: l.messages));
      },
      (r) => emit(const AuthState.loaded(authModel: null)),
    );
  }

  _authRegister({required AuthModel authModel}) async {
    emit(const AuthState.loading());
    final data = await authRegisterUseCase(params: authModel);
    data.fold((l) {
      toastUseCase(params: l.messages);
      emit(AuthState.error(message: l.messages));
    }, (r) {
      toastUseCase(params: 'Welcome, ${r.name}!');
      emit(AuthState.loaded(authModel: r));
    });
  }
}
