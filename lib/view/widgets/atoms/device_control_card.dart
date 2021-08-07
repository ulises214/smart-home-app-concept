// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view.dart';

/// A widget to be used in the control pages of the devices
class DeviceControlCard extends StatelessWidget {
  /// Creates a card with predefined styles
  const DeviceControlCard({
    required Color color,
    required Widget child,
    Key? key,
  })  : _color = color,
        _child = child,
        super(key: key);

  final Color _color;
  final Widget _child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: WalleColors.borderRadius,
      child: Container(
        color: _color.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _child,
        ),
      ),
    );
  }
}
