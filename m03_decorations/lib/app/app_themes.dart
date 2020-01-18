import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:m03_decorations/app/app_colors.dart';


bool useDarkTheme = true;

class AppThemes {

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkThemeTealPrimary,
    accentColor: AppColors.darkThemeTealAccent,
    backgroundColor: AppColors.darkThemeNoElevation,
    errorColor: AppColors.darkThemeErrorLight,
    cardColor: AppColors.darkTheme4dpElevationOverlay,
  );

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.darkThemeTealPrimary,
    accentColor: AppColors.darkThemeTealAccent,
    backgroundColor: const Color(0xFFEEEEEE),
    errorColor: Colors.red[400],
    cardColor: const Color(0xFFE0E0E0),
  );



}