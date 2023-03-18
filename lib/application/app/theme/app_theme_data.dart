import 'package:flutter/material.dart';
import '../constants/common.dart';
import '../constants/custom_colors.dart';
import 'app_text_theme.dart';

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: CustomColors.orange),
    fontFamily: Common.defaultFontFamily,
    textTheme: AppTextTheme.getThemeText(),
    scaffoldBackgroundColor: CustomColors.dark,
    primaryColor: CustomColors.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color(0xff808080);
            }
            return CustomColors.orange;
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

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: CustomColors.blue50),
    fontFamily: Common.defaultFontFamily,
    textTheme: AppTextTheme.getThemeText(),
    scaffoldBackgroundColor: CustomColors.neutralWhite,
    primaryColor: CustomColors.textPrimary,
    iconTheme: const IconThemeData().copyWith(color: CustomColors.neutralWhite),
    canvasColor: CustomColors.neutralWhite,
    buttonTheme: const ButtonThemeData(alignedDropdown: true),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color(0xffCED3D7);
            }
            return const Color(0xff07539A);
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
