import 'package:flutter/material.dart';
import '../constants/common.dart';
import '../constants/custom_colors.dart';
import 'app_text_theme.dart';

ThemeData appThemeData(BuildContext context) {
  return ThemeData(
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: CustomColors.primary),
    fontFamily: Common.defaultFontFamily,
    textTheme: AppTextTheme.getThemeText(),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: CustomColors.textPrimary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color(0xff808080);
            }
            return const Color(0xff1919ff);
          },
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
  );
}
