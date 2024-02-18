import 'package:get_it/get_it.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_remote_data_source.dart';
import 'package:raijin/features/anime/data/datasources/remote/anime_remote_data_source_impl.dart';
import 'package:raijin/features/anime/data/repositories/anime_repository_impl.dart';
import 'package:raijin/features/anime/domain/repositories/anime_repository.dart';
import 'package:raijin/features/anime/domain/usecases/get_anime_use_case.dart';
import 'package:raijin/features/anime/presentation/bloc/anime/anime_bloc.dart';
import 'package:raijin/features/anime/presentation/bloc/complete_anime/complete_anime_bloc.dart';
import 'package:raijin/features/anime/presentation/bloc/page/page_bloc.dart';
import 'package:raijin/features/detail/data/datasources/remote/detail_remote_data_source.dart';
import 'package:raijin/features/detail/data/datasources/remote/detail_remote_data_source_impl.dart';
import 'package:raijin/features/detail/data/repositories/detail_repository_impl.dart';
import 'package:raijin/features/detail/domain/repositories/detail_repository.dart';
import 'package:raijin/features/detail/domain/usecases/get_detail_use_case.dart';
import 'package:raijin/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:raijin/features/video/data/datasources/remote/video_remote_data_source.dart';
import 'package:raijin/features/video/data/datasources/remote/video_remote_data_source_impl.dart';
import 'package:raijin/features/video/data/repositories/video_repository_impl.dart';
import 'package:raijin/features/video/domain/repositories/video_repository.dart';
import 'package:raijin/features/video/domain/usecases/get_video_use_case.dart';
import 'package:raijin/features/video/presentation/bloc/video_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory<PageBloc>(() => PageBloc());
  sl.registerFactory<AnimeBloc>(() => AnimeBloc(sl()));
  sl.registerFactory<CompleteAnimeBloc>(() => CompleteAnimeBloc(sl()));
  sl.registerFactory<DetailBloc>(() => DetailBloc(getDetailUseCase: sl()));
  sl.registerFactory<VideoBloc>(() => VideoBloc(getVideoUseCase: sl()));

  // Datasource
  sl.registerSingleton<AnimeRemoteDataSource>(AnimeRemoteDataSourceImpl());
  sl.registerSingleton<DetailRemoteDataSource>(DetailRemoteDataSourceImpl());
  sl.registerSingleton<VideoRemoteDataSource>(VideoRemoteDataSourceImpl());
  // Repository
  sl.registerSingleton<AnimeRepository>(
      AnimeRepositoryImpl(animeRemoteDataSource: sl()));
  sl.registerSingleton<DetailRepository>(
      DetailRepositoryImpl(detailRemoteDataSource: sl()));
  sl.registerSingleton<VideoRepositry>(VideoRepositryImpl(videoRemoteDataSource: sl()));


  // Usecase
  sl.registerSingleton<GetAnimeUseCase>(
    GetAnimeUseCase(animeRepository: sl()),
  );
  sl.registerSingleton<GetDetailUseCase>(
    GetDetailUseCase(detailRepository: sl()),
  );

  sl.registerSingleton<GetVideoUseCase>(
    GetVideoUseCase(videoRepositry: sl()),
  );
}
