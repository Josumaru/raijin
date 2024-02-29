import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raijin/core/routes/routes.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/core/themes/theme.dart';
import 'package:raijin/features/anime/presentation/blocs/complete_anime_bloc/complete_anime_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/history_bloc/history_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/ongoing_anime_bloc/ongoing_anime_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/page_bloc/page_bloc.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:raijin/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:raijin/features/video/presentation/bloc/video_bloc.dart';
import 'package:raijin/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(83, 0, 0, 0),
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
        SystemUiOverlay.bottom,
      ],
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [
        SystemUiOverlay.bottom,
      ],
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => sl<PageBloc>(),
        ),
        BlocProvider<AnimeBloc>(
          create: (BuildContext context) => sl<AnimeBloc>()..add(const GetOngoingAnimeEvent(page: 1, status: 'ongoing'))
        ),
        BlocProvider(
          create: (BuildContext context) => sl<AuthBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => sl<DetailBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => sl<VideoBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => sl<CompleteAnimeBloc>()..add(const GetCompleteAnimeEvent(page: 1, status: 'complete')),
        ),
        BlocProvider(
          create: (BuildContext context) => sl<HistoryBloc>()..add(const GetHistoryEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: '/',
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
