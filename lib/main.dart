import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'application/app/family_movie_app.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.dev;
  dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // Android
      statusBarIconBrightness: Brightness.dark, // Android
      statusBarBrightness: Brightness.light, // iOS
    ),
  );

  // setupLocator();
  // setupBottomSheetUI();
  // setupSnackbarUI();

  runApp(const FamilyMovieApp());
}
