import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:raijin/core/routes/route.dart';
import 'package:raijin/core/routes/route_name.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/core/themes/theme.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GlobalKey<NavigatorState> navigatorKey;
  late FToast fToast;
  @override
  void initState() {
    navigatorKey = GlobalKey<NavigatorState>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fToast = FToast();
      fToast.init(navigatorKey.currentContext!);
    });
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.onGenerateRoute,
        initialRoute: FirebaseAuth.instance.currentUser != null
            ? RouteName.homePage
            : RouteName.authPage,
        scrollBehavior: const ScrollBehavior().copyWith(
          overscroll: false,
          physics: const ClampingScrollPhysics(),
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
