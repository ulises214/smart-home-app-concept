// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers/controllers.dart';
import 'package:walles_smart_home/view/constants.dart';

/// A widget with background depending on isSelected
class ChoiceIcon extends StatefulWidget {
  /// Creates a icon with styles is is selected
  const ChoiceIcon({
    Key? key,
    required IconData icon,
    required bool selected,
    required Color baseColor,
    VoidCallback? onPressed,
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
      final theme = Get.find<UserPreferencesController>().theme;
      final color = widget._isSelected
          ? Theme.of(context).backgroundColor
          : Color.lerp(
              widget._baseColor,
              theme == ThemeMode.dark
                  ? WalleColors.darkGray
                  : WalleColors.white,
              0.5,
            );
      final iconColor = theme == ThemeMode.dark
          ? widget._isSelected
              ? WalleColors.white
              : WalleColors.black
          : widget._isSelected
              ? WalleColors.black
              : WalleColors.white;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Material(
          type: MaterialType.transparency,
          borderRadius: BorderRadius.circular(24.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(24.0),
            onTap: widget._onPressed,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Icon(widget._icon, color: iconColor),
            ),
          ),
        ),
      );
    });
  }
}
