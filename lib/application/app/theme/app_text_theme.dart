import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme getThemeText() => const TextTheme(
    // Bold
    headline5: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white
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
      color: Color(0xffF8F9FA)
    ),
    // Regular
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color(0xff66788A)
    ),
    // Bold
    button: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold
    )
  );
}