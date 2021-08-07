// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view.dart';

/// A widget to be used in the control pages of the devices
class TransparentCard extends StatelessWidget {
  /// Creates a card with predefined styles
  const TransparentCard({
    required Widget child,
    Key? key,
  })  : _child = child,
        super(key: key);

  final Widget _child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: WalleColors.borderRadius,
      child: Container(
        color: WalleColors.black.withOpacity(0.25),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _child,
        ),
      ),
    );
  }
}
