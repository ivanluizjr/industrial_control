import 'package:flutter/material.dart';

import '../colors/app_colors_theme.dart';

extension ColorThemeExtension on BuildContext {
  AppColorsTheme get appColors =>
      Theme.of(this).extension<AppColorsTheme>() ??
      AppColorsTheme.defaultTheme();
}
