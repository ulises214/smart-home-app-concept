// 🎯 Dart imports:
import 'dart:ui';

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
  _ChoiceIconState createState() => _ChoiceIconState();
}

class _ChoiceIconState extends State<ChoiceIcon> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = Get.find<UserPreferencesController>().isDarkTheme;
      final iconSize = Theme.of(context).iconTheme.size ?? 24.0;
      final containerColor = widget._isSelected
          ? Theme.of(context).backgroundColor
          : isDark
              ? WalleColors.darkGray
              : WalleColors.white;
      return ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: SizedBox(
          width: iconSize + (24.0 * 2),
          height: iconSize + (24.0 * 2),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: AnimatedContainer(
                  duration: WalleColors.animationDuration,
                  color: containerColor.withOpacity(
                    widget._isSelected ? 1.0 : 0.3,
                  ),
                  child: Center(child: Icon(widget._icon)),
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: widget._onPressed,
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
