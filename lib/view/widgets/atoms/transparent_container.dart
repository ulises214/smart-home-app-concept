// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view.dart';

/// A widget to be used in the control pages of the devices
class TransparentContainer extends StatelessWidget {
  /// Creates a card with predefined styles
  const TransparentContainer({
    required Widget child,
    Color? color,
    Key? key,
  })  : _color = color,
        _child = child,
        super(key: key);

  final Widget _child;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: WalleColors.borderRadius,
      child: Container(
        color: _color ?? WalleColors.black.withOpacity(0.25),
        child: _child,
      ),
    );
  }
}
