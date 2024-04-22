import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:raijin/core/usecases/toast_usecase/toas_use_case.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_data_source.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_data_source_impl.dart';
import 'package:raijin/features/anime/data/repositories/anime_repository_impl.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_detail_use_case.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_more_use_case.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_new_use_case.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_schedule_use_case.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_search_use_case.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_use_case.dart';
import 'package:raijin/features/anime/domain/usecases/anime_get_video_use_case.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_complete_bloc/anime_complete_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_detail_bloc/anime_detail_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_more_bloc/anime_more_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_new_bloc/anime_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_ongoing_bloc/anime_ongoing_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_popular_bloc/anime_popular_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_schedule_bloc/anime_schedule_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_search_bloc/anime_search_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_video_bloc/anime_video_bloc.dart';
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

  // Dio
  final Dio dio = Dio();
  sl.registerSingleton(dio);

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

  sl.registerFactory<AnimeBloc>(
    () => AnimeBloc(animeGetNewUseCase: sl()),
  );

  sl.registerFactory<AnimePopularBloc>(
    () => AnimePopularBloc(animeGetUseCase: sl()),
  );

  sl.registerFactory<AnimeOngoingBloc>(
    () => AnimeOngoingBloc(animeGetUseCase: sl()),
  );
  sl.registerFactory<AnimeCompleteBloc>(
    () => AnimeCompleteBloc(animeGetUseCase: sl()),
  );
  sl.registerFactory<AnimeDetailBloc>(
    () => AnimeDetailBloc(animeGetDetailUseCase: sl()),
  );

  sl.registerFactory(
    () => AnimeVideoBloc(animeGetVideoUseCase: sl(), toastUseCase: sl()),
  );
  sl.registerFactory(
    () => AnimeScheduleBloc(animeGetScheduleUseCase: sl(), toastUseCase: sl()),
  );
  sl.registerFactory<AnimeSearchBloc>(
    () => AnimeSearchBloc(animeGetSearchUseCase: sl(), toastUseCase: sl()),
  );
  sl.registerFactory<AnimeMoreBloc>(
    () => AnimeMoreBloc(animeGetMoreUseCase: sl()),
  );

  // Datasource
  sl.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceImpl(firebaseAuth: sl()),
  );
  sl.registerSingleton<AnimeRemoteDataSource>(
    AnimeRemoteDataSourceImpl(dio: sl()),
  );

  // Repository
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(authRemoteDataSource: sl()),
  );
  sl.registerSingleton<AnimeRepository>(
    AnimeRepositoryImpl(animeRemoteDataSource: sl()),
  );

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
  sl.registerSingleton<ToastUseCase>(
    ToastUseCase(fToast: sl()),
  );
  sl.registerSingleton<AnimeGetNewUseCase>(
    AnimeGetNewUseCase(animeRepository: sl()),
  );
  sl.registerSingleton<AnimeGetUseCase>(
    AnimeGetUseCase(animeRepository: sl()),
  );
  sl.registerSingleton<AnimeGetDetailUseCase>(
    AnimeGetDetailUseCase(animeRepository: sl()),
  );
  sl.registerSingleton<AnimeGetVideoUseCase>(
    AnimeGetVideoUseCase(animeRepository: sl()),
  );
  sl.registerSingleton<AnimeGetScheduleUseCase>(
    AnimeGetScheduleUseCase(animeRepository: sl()),
  );
  sl.registerSingleton<AnimeGetSearchUseCase>(
    AnimeGetSearchUseCase(animeRepository: sl()),
  );
  sl.registerSingleton<AnimeGetMoreUseCase>(
    AnimeGetMoreUseCase(animeRepository: sl()),
  );
}
