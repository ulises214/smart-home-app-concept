// 🎯 Dart imports:
import 'dart:ui';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers.dart';
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
    final sigma = _color == null ? 5.0 : 0.0;
    return Obx(
      () {
        final isDarkTheme = Get.find<UserPreferencesController>().isDarkTheme;
        final color = Theme.of(context).cardColor;
        return AnimatedSwitcher(
          duration: WalleColors.animationDuration,
          child: ClipRRect(
            key: ValueKey<bool>(_color == null),
            borderRadius: WalleColors.borderRadius,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: sigma,
                sigmaY: sigma,
              ),
              child: Container(
                color: _color ?? color,
                child: _child,
              ),
            ),
          ),
        );
      },
    );
  }
}
