import 'package:flutter/material.dart';

/// These convert the older 2014 TextTheme style names to the newer, 2018 names.
/// Example usage:
///
///         Text(
///           'Your text here',
///           style: Theme.of(context).primaryTextTheme.headline1,
///         ),
///
extension TextTheme2018 on TextTheme {
  TextStyle get headline1 => this.display4;
  TextStyle get headline2 => this.display3;
  TextStyle get headline3 => this.display2;
  TextStyle get headline4 => this.display1;
  TextStyle get headline5 => this.headline;
  TextStyle get headline6 => this.title;
  TextStyle get subtitle1 => this.subhead;
  TextStyle get body1 => this.body2;
  TextStyle get body2 => this.body1;
  TextStyle get caption => this.caption;
  TextStyle get button => this.button;
  TextStyle get subtitle2 => this.subtitle;
}
