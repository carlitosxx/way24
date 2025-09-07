import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/core/presentation/theme/color_scheme.dart';

/// Widget app
class MyApp extends StatefulWidget {
  /// This Widget MyApp is my configuration initial
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = GoRouter(
    initialLocation: SplashRoute.path,
    routes: $appRoutes,
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        title: 'way24',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Nunito',
          colorScheme: lightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          fontFamily: 'Nunito',
          colorScheme: darkColorScheme,
          useMaterial3: true,
        ),
        routerConfig: _router,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES')],
      ),
    );
  }
}
