import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Some utilities for the color class
extension ComplementaryColor on Color {
  /// Gets the complementary color
  Color getComplementaryColor() {
    final hsl = HSLColor.fromColor(this);
    var newH = hsl.hue + 180;
    if (newH > 360) newH -= 360;
    return hsl.withHue(newH).toColor();
  }
}
