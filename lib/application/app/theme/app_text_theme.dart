import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme getThemeText() => const TextTheme(
        // Bold
        headline1: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
        ),
        headline2: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        headline5: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        // Bold
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF03213E),
        ),
        // Regular
        bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        // Regular
        caption: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        // Bold
        button: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
}
