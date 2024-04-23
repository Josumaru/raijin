import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:raijin/core/routes/route.dart';
import 'package:raijin/core/routes/route_name.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/core/themes/theme.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_complete_bloc/anime_complete_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_detail_bloc/anime_detail_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_more_bloc/anime_more_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_new_bloc/anime_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_ongoing_bloc/anime_ongoing_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_popular_bloc/anime_popular_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_schedule_bloc/anime_schedule_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_search_bloc/anime_search_bloc.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_video_bloc/anime_video_bloc.dart';
import 'package:raijin/features/anime/presentation/cubits/anime_schedule_cubit/anime_schedule_cubit.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GlobalKey<NavigatorState> navigatorKey;
  late FToast fToast;
  late String day;
  @override
  void initState() {
    navigatorKey = GlobalKey<NavigatorState>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fToast = FToast();
      fToast.init(navigatorKey.currentContext!);
    });
    day = DateFormat('EEEE').format(DateTime.now()).toLowerCase();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              sl<AnimeBloc>()..add(const AnimeEvent.animeGetNew(page: 1)),
        ),
        BlocProvider(
          create: (context) => sl<AnimePopularBloc>()
            ..add(
              const AnimePopularEvent.animeGetPopular(
                status: '',
                order: 'popular',
                type: '',
                page: 1,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => sl<AnimeOngoingBloc>()
            ..add(
              const AnimeOngoingEvent.animeGetOngoing(
                status: 'Currently+Airing',
                order: 'latest',
                type: '',
                page: 1,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => sl<AnimeCompleteBloc>()
            ..add(
              const AnimeCompleteEvent.animeGetComplete(
                status: 'Finished+Airing',
                order: 'latest',
                type: '',
                page: 1,
              ),
            ),
        ),
        BlocProvider(create: (context) => sl<AnimeDetailBloc>()),
        BlocProvider(create: (context) => sl<AnimeVideoBloc>()),
        BlocProvider(
          create: (context) => sl<AnimeScheduleBloc>()
            ..add(
              AnimeScheduleEvent.animeGetSchedule(
                day: day,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => AnimeScheduleCubit()..select(day: day),
        ),
        BlocProvider(
          create: (context) => sl<AnimeSearchBloc>(),
        ),
        BlocProvider(create: (context) => sl<AnimeMoreBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.onGenerateRoute,
        initialRoute: FirebaseAuth.instance.currentUser != null
            ? RouteName.mainPage
            : RouteName.authPage,
        scrollBehavior: const ScrollBehavior().copyWith(
          overscroll: false,
          physics: const BouncingScrollPhysics(),
        ),
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        builder: (context, child) => Overlay(
          initialEntries: [
            if (child != null) ...[
              OverlayEntry(
                builder: (context) => child,
              )
            ]
          ],
        ),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
