import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color standardBlue;
  final Color darkBlue;
  final Color lightGray;
  final Color red;
  final Color green;
  final Color white;
  final Color black;
  final Color greyNeutral;

  const AppColorsTheme({
    required this.standardBlue,
    required this.darkBlue,
    required this.lightGray,
    required this.red,
    required this.green,
    required this.white,
    required this.black,
    required this.greyNeutral,
  });

  static AppColorsTheme defaultTheme() {
    return const AppColorsTheme(
      standardBlue: Color(0xFF2188FF),
      darkBlue: Color(0xFF17192D),
      lightGray: Color(0xFFEAEFF3),
      red: Color(0xFFED3833),
      green: Color(0xFF52C41A),
      white: Colors.white,
      black: Colors.black,
      greyNeutral: Color(0xFF8E98A3),
    );
  }

  @override
  AppColorsTheme copyWith({
    Color? standardBlue,
    Color? darkBlue,
    Color? lightGray,
    Color? red,
    Color? green,
    Color? white,
    Color? black,
    Color? greyNeutral,
  }) {
    return AppColorsTheme(
      standardBlue: standardBlue ?? this.standardBlue,
      darkBlue: darkBlue ?? this.darkBlue,
      lightGray: lightGray ?? this.lightGray,
      red: red ?? this.red,
      green: green ?? this.green,
      white: white ?? this.white,
      black: black ?? this.black,
      greyNeutral: greyNeutral ?? this.greyNeutral,
    );
  }

  @override
  AppColorsTheme lerp(covariant AppColorsTheme? other, double t) {
    return AppColorsTheme(
      standardBlue:
          Color.lerp(standardBlue, other?.standardBlue, t) ?? standardBlue,
      darkBlue: Color.lerp(darkBlue, other?.darkBlue, t) ?? darkBlue,
      lightGray: Color.lerp(lightGray, other?.lightGray, t) ?? lightGray,
      red: Color.lerp(red, other?.red, t) ?? red,
      green: Color.lerp(green, other?.green, t) ?? green,
      white: Color.lerp(white, other?.white, t) ?? white,
      black: Color.lerp(black, other?.black, t) ?? black,
      greyNeutral:
          Color.lerp(greyNeutral, other?.greyNeutral, t) ?? greyNeutral,
    );
  }
}
