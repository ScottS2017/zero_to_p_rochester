import 'package:flutter/material.dart';
import 'package:m01_organizing_a_flutter_app/app/app_themes.dart';
import 'package:m01_organizing_a_flutter_app/utils/enums.dart';

class AppColors {

  static Color appCardColor = useDarkTheme ? darkThemeCard : whiteTextColor;
  static Color appTextColor = useDarkTheme ? whiteTextColor : blackTextColor;


  // General Colors
  static const Color whiteTextColor = const Color(0xB3FFFFFF);
  static const Color blackTextColor = const Color(0xFF111111);
  static const Color dropShadowColor = const Color(0x33000000);
  static const Color offWhitePageBackground = Color(0xFFF9F9F9);

  static const Color bronze = const Color(0xFFD6943A);
  static const Color silver = const Color(0xFFD9D9D9);
  static const Color gold = const Color(0xFFF7D44E);

  // Material Design Color Sets
  static const Color primaryBlue = const Color(0xff2962ff);
  static const Color primaryLightBlue = const Color(0xff768fff);
  static const Color primaryDarkBlue = const Color(0xff0039cb);

  static const Color primaryRed = const Color(0xffd50000);
  static const Color primaryLightRed = const Color(0xffff5131);
  static const Color primaryDarkRed = const Color(0xff9b0000);

  static const Color primaryGreen = const Color(0xff00c853);
  static const Color primaryLightGreen = const Color(0xff5efc82);
  static const Color primaryDarkGreen = const Color(0xff009624);

  static const Color primaryPurple = const Color(0xffaa00ff);
  static const Color primaryLightPurple = const Color(0xffe254ff);
  static const Color primaryDarkPurple = const Color(0xff7200ca);

  static const Color primaryDarkYellow = const Color(0xffffd600);
  static const Color primaryDarkLightYellow = const Color(0xffffff52);
  static const Color primaryDarkDarkYellow = const Color(0xffc7a500);

  // Dark Theme
  static const Color darkThemeWhite = Color(0xFFE1E1E1);
  static const Color darkThemeNoElevation = Color(0xFF121212);
  static const Color darkThemeCard = Color(0xFF1D1D1D);
  static const Color darkThemeAppBar = Color(0xFF1F1F1F);
  static const Color darkThemeAppBarText = Color(0xFFE1E1E1);
  static const Color darkTheme1dpElevationOverlay = Color(0xFF1D1D1D);
  static const Color darkTheme2dpElevationOverlay = Color(0xFF212121);
  static const Color darkTheme3dpElevationOverlay = Color(0xFF242424);
  static const Color darkTheme4dpElevationOverlay = Color(0xFF272727);
  static const Color darkTheme6dpElevationOverlay = Color(0xFF2C2C2C);
  static const Color darkTheme8dpElevationOverlay = Color(0xFF2D2D2D);
  static const Color darkTheme12dpElevationOverlay = Color(0xFF323232);
  static const Color darkTheme16dpElevationOverlay = Color(0xFF353535);
  static const Color darkTheme24dpElevationOverlay = Color(0xFF373737);
  static const Color darkThemeSelectedIcons = Color(0xFFE1E1E1);
  static const Color darkThemeUnselectedIcons = Color(0x55FFFFFF);
  static const Color darkThemeErrorLight = Color(0xFFCF6679);
  static const Color darkThemeErrorDark = Color(0xFFB00020);

  static Color darkThemePurplePrimary = Colors.purple[200];
  static Color darkThemePurpleVariant = Colors.purple[700];
  static const Color darkThemeTealAccent = Color(0xFF03DAC6);
  static Color darkThemeTealPrimary = Colors.teal[200];
  static Color darkThemeTealVariant = Colors.teal[800];
  static Color darkThemeOrangePrimary = Colors.orange[200];
  static Color darkThemeOrangeAccent = Colors.orange[500];
  static Color darkThemeOrangeVariant = Colors.orange[700];


  /// This will calculate the color to show for a translucent object
  /// that is above another object. If a state was passed in for the object
  /// on top, such as for a button, you can specify to determine the combined color
  /// by the state of the foreground object. Or, if determineElevationByState
  /// is null because the forground object doesn't have a state that changes,
  /// then the color will be determined by taking the difference in elevation
  /// between the objects and their colors into consideration.
  ///
  static Color getDarkThemeOverlayColor(
    {ColorsByState determineElevationByState,
      int differenceInElevationBetweenForegroundAndBackgroundObjects,
      Color foregroundObjectColor,
      Color backgroundObjectColor}) {
    double transparency;

    if (determineElevationByState != null) {
      switch (determineElevationByState) {
        case ColorsByState.enabled:
          {
            transparency = 0;
          }
          break;

        case ColorsByState.hovered:
          {
            transparency = 0.04;
          }
          break;

        case ColorsByState.focused:
          {
            transparency = 0.12;
          }
          break;

        case ColorsByState.pressed:
          {
            transparency = 0.1;
          }
          break;

        case ColorsByState.dragged:
          {
            transparency = 0.08;
          }
          break;

        default:
          {
            transparency = 0;
          }
      }
    } else {
      switch (differenceInElevationBetweenForegroundAndBackgroundObjects) {
        case 0:
          {
            transparency = 0.0;
          }
          break;

        case 1:
          {
            transparency = 0.05;
          }
          break;

        case 2:
          {
            transparency = 0.07;
          }
          break;

        case 3:
          {
            transparency = 0.08;
          }
          break;

        case 4:
        case 5:
          {
            transparency = 0.09;
          }
          break;

        case 6:
        case 7:
          {
            transparency = 0.11;
          }
          break;

        case 8:
        case 9:
        case 10:
        case 11:
          {
            transparency = 0.12;
          }
          break;

        case 12:
        case 13:
        case 14:
        case 15:
          {
            transparency = 0.14;
          }
          break;

        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
          {
            transparency = 0.15;
          }
          break;

        case 24:
          {
            transparency = 0.16;
          }
          break;

        default:
          {
            transparency = 0.16;
          }
      }
    }

    return Color.alphaBlend(foregroundObjectColor.withOpacity(transparency), backgroundObjectColor);
  }
}
