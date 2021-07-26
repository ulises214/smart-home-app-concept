import 'package:flutter/material.dart';

/// A icons with a rotated transform
class RotatedIcon extends StatelessWidget {
  /// Creates an icons with a rotated transform
  const RotatedIcon({
    required IconData icon,
    Key? key,
    double? angle,
    double? size,
  })  : _icon = icon,
        _angle = angle,
        _size = size,
        super(key: key);
  final double? _angle;
  final IconData _icon;
  final double? _size;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _angle ?? 0,
      child: Icon(
        _icon,
        size: _size ?? 32.0,
      ),
    );
  }
}
