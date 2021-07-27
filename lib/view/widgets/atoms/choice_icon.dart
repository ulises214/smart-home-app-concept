// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers/controllers.dart';
import 'package:walles_smart_home/view/constants.dart';
import 'package:walles_smart_home/view/utils.dart';

/// A widget with background depending on isSelected
class ChoiceIcon extends StatefulWidget {
  /// Creates a icon with styles is is selected
  const ChoiceIcon({
    required IconData icon,
    required bool selected,
    required Color baseColor,
    VoidCallback? onPressed,
    Key? key,
  })  : _icon = icon,
        _isSelected = selected,
        _baseColor = baseColor,
        _onPressed = onPressed,
        super(key: key);

  final IconData _icon;
  final bool _isSelected;
  final Color _baseColor;
  final VoidCallback? _onPressed;

  @override
  _ChoiceIconState createState() => _ChoiceIconState();
}

class _ChoiceIconState extends State<ChoiceIcon> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = Get.find<UserPreferencesController>().isDarkTheme;
      final color = widget._isSelected
          ? Theme.of(context).backgroundColor
          : Color.lerp(
              widget._baseColor,
              isDark ? WalleColors.darkGray : WalleColors.white,
              0.5,
            );
      final iconSize = Theme.of(context).iconTheme.size ?? 24.0;
      return ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: AnimatedContainer(
          color: color,
          duration: const Duration(milliseconds: 300),
          width: iconSize + (24.0 * 2),
          height: iconSize + (24.0 * 2),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: widget._onPressed,
              child: Center(child: Icon(widget._icon)),
            ),
          ),
        ),
      );
    });
  }
}
