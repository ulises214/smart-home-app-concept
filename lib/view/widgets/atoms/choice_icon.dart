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
    required Color color,
    required bool selected,
    VoidCallback? onPressed,
    Key? key,
  })  : _icon = icon,
        _isSelected = selected,
        _onPressed = onPressed,
        _color = color,
        super(key: key);

  final IconData _icon;
  final bool _isSelected;
  final VoidCallback? _onPressed;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final theme = Get.find<UserPreferencesController>().theme;
      final iconSize = Theme.of(context).iconTheme.size ?? 24.0;
      final containerColor = _color.getBackgroundByTheme(theme);
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
