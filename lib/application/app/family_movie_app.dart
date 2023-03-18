import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'app.router.dart';
import 'app.router.dart';
import 'constants/common.dart';
import 'theme/app_theme_data.dart';

class FamilyMovieApp extends StatelessWidget {
  const FamilyMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Common.titleBar,
      theme: darkThemeData(context),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('id'),
      ],
    );
  }
}
