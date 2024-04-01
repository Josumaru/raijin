import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:raijin/core/usecases/toast_usecase/toas_use_case.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_data_source.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_data_source_impl.dart';
import 'package:raijin/features/anime/data/repositories/anime_repository_impl.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_new_anime.dart';
import 'package:raijin/features/anime/presentation/bloc/anime_bloc.dart';
import 'package:raijin/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:raijin/features/auth/data/datasources/remote/auth_reomote_data_source_impl.dart';
import 'package:raijin/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:raijin/features/auth/domain/repositories/auth_repository.dart';
import 'package:raijin/features/auth/domain/usecases/auth_login_use_case.dart';
import 'package:raijin/features/auth/domain/usecases/auth_logout_use_case.dart';
import 'package:raijin/features/auth/domain/usecases/auth_register_use_case.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // FirebaseAuth
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  sl.registerSingleton(firebaseAuth);

  

  // FToast
  FToast fToast = FToast();
  sl.registerSingleton(fToast);

  // Bloc
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      authLoginUseCase: sl(),
      authLogoutUseCase: sl(),
      authRegisterUseCase: sl(),
      toastUseCase: sl(),
    ),
  );

  sl.registerFactory<AnimeBloc>(() => AnimeBloc(animeGetNewUseCase: sl()));

  // Datasource
  sl.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceImpl(firebaseAuth: sl()),
  );
  sl.registerSingleton<AnimeRemoteDataSource>(
      AnimeRemoteDataSourceImpl(dio: sl()));

  // Repository
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(authRemoteDataSource: sl()),
  );
  sl.registerSingleton<AnimeRepository>(
      AnimeRepositoryImpl(animeRemoteDataSource: sl()));

  // UseCase
  sl.registerSingleton<AuthLoginUseCase>(
    AuthLoginUseCase(authRepository: sl()),
  );
  sl.registerSingleton<AuthRegisterUseCase>(
    AuthRegisterUseCase(authRepository: sl()),
  );
  sl.registerSingleton<AuthLogoutUseCase>(
    AuthLogoutUseCase(authrepository: sl()),
  );
  sl.registerSingleton<ToastUseCase>(ToastUseCase(fToast: sl()));
  sl.registerSingleton<AnimeGetNewUseCase>(
      AnimeGetNewUseCase(animeRepository: sl()));
}
