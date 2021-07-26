// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walles_smart_home/controllers/controllers.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers/controllers.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/utils.dart';
import 'package:walles_smart_home/view/widgets.dart';
import 'package:walles_smart_home/view/utils.dart';

/// A widget with a transparent appbar to show the background of the device
class SmartDeviceBackground extends StatefulWidget {
  /// Creates a scaffold with an appbar and a gradient
  /// background based on [device]
  const SmartDeviceBackground({
    required SmartDeviceModel device,
    required List<IconData> icons,
    required List<Widget> children,
    required Widget icon,
    Key? key,
  })  : _device = device,
        _icons = icons,
        _children = children,
        _icon = icon,
        super(key: key);
  final SmartDeviceModel _device;
  final List<IconData> _icons;
  final List<Widget> _children;
  final Widget _icon;
  @override
  _SmartDeviceBackgroundState createState() => _SmartDeviceBackgroundState();
}

class _SmartDeviceBackgroundState extends State<SmartDeviceBackground> {
  late final PageController _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0, keepPage: true);
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
              gradient: widget._device.color.getGradient(currentTheme),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TransparentAppBar(
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Hero(
                        tag: widget._device.id,
                        child: widget._icon,
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      MainTitle(text: widget._device.name),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(
                      4,
                      (index) => ChoiceIcon(
                        icon: widget._icons[index],
                        selected: _currentIndex == index,
                        baseColor: widget._device.color,
                        onPressed: () => _changePage(index),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    children: widget._children,
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
