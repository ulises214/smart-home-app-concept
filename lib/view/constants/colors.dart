// 🐦 Flutter imports:
import 'package:flutter/material.dart';

const _black = Color.fromRGBO(20, 20, 26, 1);

const _darkGray = Color.fromRGBO(40, 46, 58, 1);
const _white = Color.fromRGBO(247, 246, 248, 1);

ThemeData _buildTheme({
  required ThemeData base,
  Color? backgroundColor,
  required Color scaffoldColor,
  required Color textColor,
}) =>
    base.copyWith(
      scaffoldBackgroundColor: scaffoldColor,
      backgroundColor: backgroundColor ?? base.backgroundColor,
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
        labelColor: textColor,
        unselectedLabelColor: textColor.withAlpha((255 * 0.3).toInt()),
      ),
    );

/// Define all color that will used in the app
abstract class WalleColors {
  /// The theme to style the app in dark mode
  static ThemeData get darkTheme => _buildTheme(
        base: ThemeData.dark(),
        backgroundColor: _darkGray,
        scaffoldColor: _black,
        textColor: _white,
      );

  /// The theme to style the app in light mode
  static ThemeData get lightTheme => _buildTheme(
        base: ThemeData.light(),
        scaffoldColor: _white,
        textColor: _black,
      );
}
