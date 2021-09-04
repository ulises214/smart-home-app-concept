// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view/constants/colors.dart';

/// Some utilities for the color class
extension ColorUtilities on Color {
  /// Gets the complementary color
  Color getComplementaryColor() {
    final hsl = HSLColor.fromColor(this);
    var newH = hsl.hue + 180;
    if (newH > 360) newH -= 360;
    return hsl.withHue(newH).toColor();
  }

  /// Converts a color to their shiny version
  Color getShiny() {
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness(0.8).toColor();
  }

  /// Get an specific color by theme
  Color getBackgroundByTheme(ThemeMode theme) {
    return theme == ThemeMode.dark ? getDark() : getShiny();
  }

  /// Converts a color to their dark version
  Color getOpaque() {
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness((hsl.lightness - 0.20).clamp(0, 250)).toColor();
  }

  /// Get this color combined with white
  Color getClear() => Color.lerp(Colors.white, this, 0.7)!;

  /// Get this color combined with black
  Color getDark() => Color.lerp(
        WalleColors.black,
        this,
        0.5,
      )!;
}
