// 🐦 Flutter imports:
import 'package:flutter/material.dart';

const _black = Color.fromRGBO(20, 20, 26, 1);
const _darkGray = Color.fromRGBO(0x28, 0x2E, 0x3A, 1);
const _white = Color.fromRGBO(247, 246, 248, 1);
const _pink = Color.fromRGBO(0xF2, 0x5A, 0xA2, 1);
const _blue = Color.fromRGBO(0x01, 0xA8, 0xF4, 1);
const _red = Color.fromRGBO(0xDE, 0x2D, 0x31, 1);
const _darkBlue = Color.fromRGBO(0x5D, 0x0B, 0xD5, 1);
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

/// Define all color that will used in the app
abstract class WalleColors {
  /// The red used in the app
  static const red = _red;

  /// The black used in the app
  static const black = _black;

  /// The red darkGray in the app
  static const darkGray = _darkGray;

  /// The white used in the app
  static const white = _white;

  /// The pink used in the app
  static const pink = _pink;

  /// The blue used in the app
  static const blue = _blue;

  /// The dark blue used in the app
  static const darkBlue = _darkBlue;

  /// The theme to style the app in dark mode
  static ThemeData get darkTheme => _buildTheme(
        base: ThemeData.dark(),
        backgroundColor: _darkGray,
        accentColor: _pink,
        scaffoldColor: _black,
        textColor: _white,
      );

  /// The theme to style the app in light mode
  static ThemeData get lightTheme => _buildTheme(
        base: ThemeData.light(),
        scaffoldColor: _white,
        accentColor: _pink,
        textColor: _black,
      );
}
