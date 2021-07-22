// 🐦 Flutter imports:
import 'package:flutter/material.dart';

/// Define all color that will used in the app
abstract class WalleColors {
  /// The accentBlue used in the app;
  static const accentBlue = _accentBlue;

  /// The blue used in the app;
  static const blue = _blue;

  /// The black used in the app;
  static const black = _black;

  /// The darkGray used in the app;
  static const darkGray = _darkGray;

  /// The darkBlue used in the app;
  static const darkBlue = _darkBlue;

  /// The purple used in the app;
  static const purple = _purple;

  /// The pink used in the app;
  static const pink = _pink;

  /// The teal used in the app;
  static const teal = _teal;

  /// The red used in the app;
  static const red = _red;

  /// The yellow used in the app;
  static const yellow = _yellow;

  /// The white used in the app;
  static const white = _white;

  /// The theme to style the app in dark mode
  static ThemeData get darkTheme => _darkTheme;

  /// The theme to style the app in light mode
  static ThemeData get lightTheme => _lightTheme;
}

const _accentBlue = Color.fromRGBO(0x01, 0xA8, 0xF4, 1);
const _black = Color.fromRGBO(20, 20, 26, 1);
const _blue = Color.fromRGBO(0x19, 0x82, 0xC4, 1);
const _darkBlue = Color.fromRGBO(0x0C, 0x3C, 0x5A, 1);
const _darkGray = Color.fromRGBO(0x28, 0x30, 0x44, 1);
const _pink = Color.fromRGBO(0xF2, 0x5A, 0xA2, 1);
const _purple = Color.fromRGBO(0x5D, 0x0B, 0xD5, 1);
const _red = Color.fromRGBO(0xDE, 0x2D, 0x31, 1);
const _teal = Color.fromRGBO(0x10, 0x7E, 0x7D, 1);
const _white = Color.fromRGBO(247, 246, 248, 1);
const _yellow = Color.fromRGBO(0xE3, 0xB5, 0x05, 1);
final _lightTheme = _buildTheme(
  base: ThemeData.light(),
  scaffoldColor: _white,
  accentColor: _pink,
  textColor: _black,
);
final _darkTheme = _buildTheme(
  base: ThemeData.dark(),
  backgroundColor: _darkGray,
  accentColor: _pink,
  scaffoldColor: _black,
  textColor: _white,
);
ThemeData _buildTheme({
  required ThemeData base,
  required Color scaffoldColor,
  required Color textColor,
  Color? accentColor,
  Color? backgroundColor,
}) =>
    base.copyWith(
      scaffoldBackgroundColor: scaffoldColor,
      backgroundColor: backgroundColor ?? base.backgroundColor,
      accentColor: accentColor ?? base.accentColor,
      textTheme: base.textTheme.copyWith(
        headline4: base.textTheme.headline4?.copyWith(color: textColor),
        headline5: base.textTheme.headline6?.copyWith(color: textColor),
        headline6: base.textTheme.headline6?.copyWith(
          color: textColor.withAlpha((255 * 0.3).toInt()),
          fontWeight: FontWeight.w400,
        ),
      ),
      cardColor: backgroundColor ?? base.cardColor,
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: accentColor,
        unselectedLabelColor: textColor.withAlpha((255 * 0.3).toInt()),
      ),
    );
