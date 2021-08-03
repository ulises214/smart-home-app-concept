// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers/controllers.dart';
import 'package:walles_smart_home/view/utils.dart';
import 'package:walles_smart_home/view/widgets.dart';

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
    return Obx(
      () {
        final currentTheme = Get.find<UserPreferencesController>().theme;
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: widget._color.getGradient(currentTheme),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TransparentAppBar(
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Hero(
                        tag: widget._heroTag,
                        child: widget._icon,
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      MainTitle(text: widget._title),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(
                    4,
                    (index) => ChoiceIcon(
                      icon: widget._icons[index],
                      selected: _currentIndex == index,
                      onPressed: () => _changePage(index),
                    ),
                  ),
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
          ),
        );
      },
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
