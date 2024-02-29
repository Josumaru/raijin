import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:raijin/features/anime/data/datasources/local/history/history_local_data_source.dart';
import 'package:raijin/features/anime/data/datasources/local/history/history_local_data_source_impl.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_remote_data_source.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_remote_data_source_impl.dart';
import 'package:raijin/features/anime/data/repositories/anime_repository_impl.dart';
import 'package:raijin/features/anime/data/repositories/history_repository_impl.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';
import 'package:raijin/features/anime/domain/repositories/history_repository.dart';
import 'package:raijin/features/anime/domain/usecases/delete_history_use_case.dart';
import 'package:raijin/features/anime/domain/usecases/get_anime_use_case.dart';
import 'package:raijin/features/anime/domain/usecases/get_history_use_case.dart';
import 'package:raijin/features/anime/domain/usecases/set_history_use_case.dart';
import 'package:raijin/features/anime/presentation/blocs/complete_anime_bloc/complete_anime_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/history_bloc/history_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/ongoing_anime_bloc/ongoing_anime_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/page_bloc/page_bloc.dart';
import 'package:raijin/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:raijin/features/auth/data/datasources/local/auth_local_data_source_impl.dart';
import 'package:raijin/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:raijin/features/auth/data/datasources/remote/auth_remote_data_source_impl.dart';
import 'package:raijin/features/auth/data/models/auth_model.dart';
import 'package:raijin/features/auth/data/repositories/auth_repositories_impl.dart';
import 'package:raijin/features/auth/domain/repositories/auth_repository.dart';
import 'package:raijin/features/auth/domain/usecases/login_auth_use_case.dart';
import 'package:raijin/features/auth/domain/usecases/logout_auth_use_case.dart';
import 'package:raijin/features/auth/domain/usecases/register_auth_use_case.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:raijin/features/detail/data/datasources/remote/detail_remote_data_source.dart';
import 'package:raijin/features/detail/data/datasources/remote/detail_remote_data_source_impl.dart';
import 'package:raijin/features/detail/data/repositories/detail_repository_impl.dart';
import 'package:raijin/features/detail/domain/repositories/detail_repository.dart';
import 'package:raijin/features/detail/domain/usecases/get_detail_use_case.dart';
import 'package:raijin/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:raijin/features/video/data/datasources/remote/video_remote_data_source.dart';
import 'package:raijin/features/video/data/datasources/remote/video_remote_data_source_impl.dart';
import 'package:raijin/features/video/data/models/video_model.dart';
import 'package:raijin/features/video/data/repositories/video_repository_impl.dart';
import 'package:raijin/features/video/domain/repositories/video_repository.dart';
import 'package:raijin/features/video/domain/usecases/get_video_use_case.dart';
import 'package:raijin/features/video/presentation/bloc/video_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // Dio
  final Dio dio = Dio();
  sl.registerSingleton(dio);

  // Hive
  await Hive.initFlutter();

  // Hive Adapter
  Hive.registerAdapter(AuthModelAdapter());
  Hive.registerAdapter(VideoModelAdapter());

  // HiveBox
  final authBox = await Hive.openBox<AuthModel>('authBox');
  final historyBox = await Hive.openBox<VideoModel>('HistoryBox');

  // Register Hive
  sl.registerSingleton<Box<AuthModel>>(authBox);
  sl.registerSingleton<Box<VideoModel>>(historyBox);

  // Bloc
  sl.registerFactory<PageBloc>(() => PageBloc());
  sl.registerFactory<AnimeBloc>(() => AnimeBloc(sl()));
  sl.registerFactory<CompleteAnimeBloc>(() => CompleteAnimeBloc(sl()));
  sl.registerFactory<DetailBloc>(() => DetailBloc(getDetailUseCase: sl()));
  sl.registerFactory<VideoBloc>(() => VideoBloc(getVideoUseCase: sl()));
  sl.registerFactory<AuthBloc>(() => AuthBloc(registerAuthUseCase: sl(), loginAuthUseCase: sl(), logoutAuthUseCase: sl()));
  sl.registerFactory<HistoryBloc>(() => HistoryBloc(deleteHistoryUseCase: sl(), getHistoryUseCase: sl(), setHistoryUseCase: sl()));

  // Datasource
  sl.registerSingleton<AnimeRemoteDataSource>(AnimeRemoteDataSourceImpl(dio: sl()));
  sl.registerSingleton<DetailRemoteDataSource>(DetailRemoteDataSourceImpl());
  sl.registerSingleton<VideoRemoteDataSource>(VideoRemoteDataSourceImpl());
  sl.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());
  sl.registerSingleton<AuthLocalDataSource>(AuthLocalDataSourceImpl(authBox: sl()));
  sl.registerSingleton<HistoryLocalDataSource>(HistoryLocalDataSourceImpl(historyBox: sl()));

  // Repository
  sl.registerSingleton<AnimeRepository>(AnimeRepositoryImpl(animeRemoteDataSource: sl()));
  sl.registerSingleton<DetailRepository>(DetailRepositoryImpl(detailRemoteDataSource: sl()));
  sl.registerSingleton<VideoRepositry>(VideoRepositryImpl(videoRemoteDataSource: sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(authRemoteDataSource: sl(), authLocalDataSource: sl()));
  sl.registerSingleton<HistoryRepository>(HistoryRepositoryImpl(historyLocalDataSource: sl()));

  // Usecase
  sl.registerSingleton<GetAnimeUseCase>(GetAnimeUseCase(animeRepository: sl()));
  sl.registerSingleton<GetDetailUseCase>(GetDetailUseCase(detailRepository: sl()));
  sl.registerSingleton<GetVideoUseCase>(GetVideoUseCase(videoRepositry: sl()));
  sl.registerSingleton<RegisterAuthUseCase>(RegisterAuthUseCase(authRepository: sl()));
  sl.registerSingleton<LoginAuthUseCase>(LoginAuthUseCase(authRepository: sl()));
  sl.registerSingleton<LogoutAuthUseCase>(LogoutAuthUseCase(authRepository: sl()));
  sl.registerSingleton<DeleteHistoryUseCase>(DeleteHistoryUseCase(historyRepository: sl()));
  sl.registerSingleton<GetHistoryUseCase>(GetHistoryUseCase(historyRepository: sl()));
  sl.registerSingleton<SetHistoryUseCase>(SetHistoryUseCase(historyRepository: sl()));

}
