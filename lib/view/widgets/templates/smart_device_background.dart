// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view.dart';

/// A widget with a transparent appbar to show the background of the device
class SmartDeviceBackground extends StatefulWidget {
  /// Creates a scaffold with an appbar and a gradient
  /// background based on [color]
  const SmartDeviceBackground({
    required Color color,
    required String heroTag,
    required String title,
    required List<IconData> icons,
    required List<Widget> children,
    required Widget icon,
    int initialIndex = 0,
    Key? key,
  })  : _color = color,
        _heroTag = heroTag,
        _title = title,
        _icons = icons,
        _children = children,
        _icon = icon,
        _initialIndex = initialIndex,
        super(key: key);
  final Color _color;
  final String _heroTag;
  final String _title;
  final List<IconData> _icons;
  final List<Widget> _children;
  final Widget _icon;
  final int _initialIndex;
  @override
  _SmartDeviceBackgroundState createState() => _SmartDeviceBackgroundState();
}

class _SmartDeviceBackgroundState extends State<SmartDeviceBackground> {
  late final PageController _controller;
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget._initialIndex;
    _controller = PageController(
      initialPage: widget._initialIndex,
      keepPage: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _AppBar(
            heroTag: widget._heroTag,
            icon: widget._icon,
            title: widget._title,
          ),
          _IconList(
            selectedColor: widget._color,
            icons: widget._icons,
            selectedIcon: _currentIndex,
            onChange: _changePage,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _controller,
                children: widget._children,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _changePage(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    setState(() => _currentIndex = index);
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.heroTag,
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String heroTag;
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TransparentAppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: heroTag,
            child: icon,
          ),
          const SizedBox(
            width: 15.0,
          ),
          MainTitle(text: title),
        ],
      ),
    );
  }
}

class _IconList extends StatelessWidget {
  const _IconList({
    required this.icons,
    required this.selectedIcon,
    required this.onChange,
    required this.selectedColor,
    Key? key,
  }) : super(key: key);

  final List<IconData> icons;
  final int selectedIcon;
  final void Function(int) onChange;
  final Color selectedColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
        4,
        (index) => ChoiceIcon(
          color: selectedColor,
          icon: icons[index],
          selected: selectedIcon == index,
          onPressed: () => onChange(index),
        ),
      ),
    );
  }
}
