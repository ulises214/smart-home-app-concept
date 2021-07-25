// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

/// Store and manage the user information like the theme
class UserPreferencesController extends GetxController {
  final _theme = ThemeMode.dark.obs;

  /// Returns the current theme
  ThemeMode get theme => _theme.value;

  /// Toggle the current theme
  void toggleTheme() {
    if (theme == ThemeMode.dark) {
      _theme.value = ThemeMode.light;
      return;
    }
    _theme.value = ThemeMode.dark;
  }
}
