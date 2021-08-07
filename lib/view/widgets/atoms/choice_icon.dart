// 🎯 Dart imports:
import 'dart:ui';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers.dart';
import 'package:walles_smart_home/view.dart';

/// A widget with background depending on isSelected
class ChoiceIcon extends StatelessWidget {
  /// Creates a icon with styles is is selected
  const ChoiceIcon({
    required IconData icon,
    required bool selected,
    VoidCallback? onPressed,
    Key? key,
  })  : _icon = icon,
        _isSelected = selected,
        _onPressed = onPressed,
        super(key: key);

  final IconData _icon;
  final bool _isSelected;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = Get.find<UserPreferencesController>().isDarkTheme;
      final iconSize = Theme.of(context).iconTheme.size ?? 24.0;
      final containerColor = _isSelected
          ? Theme.of(context).backgroundColor
          : isDark
              ? WalleColors.darkGray
              : WalleColors.white;
      return TransparentContainer(
        color: _isSelected ? containerColor : null,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: _onPressed,
            child: SizedBox(
              width: iconSize + (24.0 * 2),
              height: iconSize + (24.0 * 2),
              child: Center(
                child: Icon(_icon),
              ),
            ),
          ),
        ),
      );
    });
  }
}
