import 'package:flutter/material.dart';

const _black = Color.fromRGBO(20, 20, 26, 1);
const _white = Color.fromRGBO(247, 246, 248, 1);

abstract class WalleColors {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: _black,
    tabBarTheme: ThemeData.dark().tabBarTheme.copyWith(
          labelColor: _white,
          unselectedLabelColor: _white.withAlpha((255 * 0.4).toInt()),
        ),
  );
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: _white,
    tabBarTheme: ThemeData.light().tabBarTheme.copyWith(
          labelColor: _black,
          unselectedLabelColor: _black.withAlpha((255 * 0.3).toInt()),
        ),
  );
}
