import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:m02_static_ui_elements/app/app_colors.dart';

bool useDarkTheme = true;

class AppThemes {

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkThemeTealPrimary,
    accentColor: AppColors.darkThemeTealAccent,
    backgroundColor: AppColors.darkThemeNoElevation,
    errorColor: AppColors.darkThemeErrorLight,
    cardColor: AppColors.darkTheme4dpElevationOverlay,
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.darkThemeTealPrimary,
    accentColor: AppColors.darkThemeTealAccent,
    backgroundColor: Color(0xFFEEEEEE),
    errorColor: Colors.red[400],
    cardColor: Color(0xFFE0E0E0),
  );



}