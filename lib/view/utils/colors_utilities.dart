// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  /// Converts a color to their dark version
  Color getOpaque() {
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness(0.15).toColor();
  }

  /// Get this color combined with white
  Color getClear() => Color.lerp(Colors.white, this, 0.7)!;

  /// Get this color combined with black
  Color getDark() => Color.lerp(
        Color.lerp(
          Colors.grey,
          Colors.black,
          0.4,
        ),
        this,
        0.7,
      )!;
}
