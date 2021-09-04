// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walles_smart_home/controllers/user_preferences_controller.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view.dart';

/// Creates a control with a radio button
class ControlRadioCard extends StatelessWidget {
  /// Creates a card with a circular radio button
  const ControlRadioCard({
    required Color color,
    required String title,
    required List<IconData> items,
    required void Function(int index) onChange,
    required int currentIndex,
    Key? key,
  })  : _color = color,
        _title = title,
        _items = items,
        _onChange = onChange,
        _currentIndex = currentIndex,
        super(key: key);
  final Color _color;
  final String _title;
  final List<IconData> _items;
  final void Function(int index) _onChange;
  final int _currentIndex;
  @override
  Widget build(BuildContext context) {
    return TransparentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyText(_title, bold: true),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                _items.length,
                (i) => _RadioIcon(
                  isActive: i == _currentIndex,
                  color: _color,
                  icon: _items[i],
                  onPressed: () => _onChange(i),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _RadioIcon extends StatelessWidget {
  const _RadioIcon({
    required this.color,
    required this.isActive,
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final bool isActive;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final theme = Get.find<UserPreferencesController>().theme;
      return AnimatedSwitcher(
        duration: WalleColors.animationDuration,
        child: ClipRRect(
          borderRadius: WalleColors.borderRadius,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onPressed,
              child: Container(
                key: ValueKey<bool>(isActive),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: isActive
                      ? color.getBackgroundByTheme(theme)
                      : Colors.transparent,
                  borderRadius: WalleColors.borderRadius,
                  border: Border.all(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(isActive ? 0 : 0.5),
                  ),
                ),
                child: IconTheme(
                  data: Theme.of(context).iconTheme.copyWith(size: 12.0),
                  child: Icon(icon),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
