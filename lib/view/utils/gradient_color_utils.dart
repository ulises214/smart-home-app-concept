// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import './colors_utilities.dart';

/// Utilities to get a gradient based on this color
extension GradientColorUtils on Color {
  /// Get a gradient based on this color and the current theme
  LinearGradient getGradient(
    ThemeMode theme, [
    Axis direction = Axis.vertical,
  ]) {
    return LinearGradient(
      colors: theme == ThemeMode.light
          ? [getShiny(), this]
          : [
              this,
              getDark(),
              getOpaque(),
            ],
      begin: direction == Axis.horizontal
          ? Alignment.centerLeft
          : Alignment.topCenter,
      end: direction == Axis.horizontal
          ? Alignment.centerRight
          : Alignment.bottomCenter,
    );
  }
}
