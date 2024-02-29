import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:raijin/features/auth/domain/entities/auth_entity.dart';
import 'package:raijin/features/auth/domain/usecases/login_auth_use_case.dart';
import 'package:raijin/features/auth/domain/usecases/logout_auth_use_case.dart';
import 'package:raijin/features/auth/domain/usecases/register_auth_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterAuthUseCase registerAuthUseCase;
  final LoginAuthUseCase loginAuthUseCase;
  final LogoutAuthUseCase logoutAuthUseCase;

  AuthBloc({required this.registerAuthUseCase, required this.loginAuthUseCase, required this.logoutAuthUseCase}) : super(AuthInitial()) {
    on<UserAuthEvent>(onUserAuthEvent);
  }
  onUserAuthEvent(UserAuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    print('======================${event.save}====================');
    if (event.auth == 'login') {
      final data = await loginAuthUseCase(email: event.email!, password: event.password!, save: event.save!);
      data.fold(
        (l) => emit(AuthFailed()),
        (r) => emit(AuthLoaded(authEntity: r)),
      );
      return;
    } else if (event.auth == 'register') {
      emit(AuthLoading());
      final data = await registerAuthUseCase(username: event.username!, email: event.email!, password: event.password!);
      data.fold(
        (l) => emit(AuthFailed()),
        (r) => emit(AuthLoaded(authEntity: r)),
      );
    } else if (event.auth == 'logout') {
      await logoutAuthUseCase();      
      emit(AuthFailed());
    }
  }
}
