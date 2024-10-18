import 'package:flutter/material.dart';
import 'package:tractian/core/themes/colors/app_colors_theme.dart';

ThemeData _colorsTheme = ThemeData(
  brightness: Brightness.light,
  colorSchemeSeed: const Color(0xFF2188FF),
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFF2F2F2),
  extensions: const [
    AppColorsTheme(
      standardBlue: Color(0xFF2188FF),
      darkBlue: Color(0xFF17192D),
      lightGray: Color(0xFFEAEFF3),
      red: Color(0xFFED3833),
      green: Color(0xFF52C41A),
      greyNeutral: Color(0xFF8E98A3),
      white: Colors.white,
      black: Colors.black,
    ),
  ],
);

final themeData = _colorsTheme;
