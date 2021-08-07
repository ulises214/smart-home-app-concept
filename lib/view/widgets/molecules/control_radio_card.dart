// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view/constants.dart';
import 'package:walles_smart_home/view/widgets.dart';

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
    return DeviceControlCard(
      color: _color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyText(_title, bold: true, textColor: WalleColors.white),
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
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        child: AnimatedSwitcher(
          duration: WalleColors.animationDuration,
          child: Container(
            key: ValueKey<bool>(isActive),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: isActive ? WalleColors.white : Colors.transparent,
              borderRadius: WalleColors.borderRadius,
              border: isActive
                  ? null
                  : Border.all(
                      color: WalleColors.white.withOpacity(0.5),
                    ),
            ),
            child: IconTheme(
              data: Theme.of(context).iconTheme.copyWith(
                    color: isActive ? color : WalleColors.white,
                    size: 12.0,
                  ),
              child: Icon(icon),
            ),
          ),
        ),
      ),
    );
  }
}
