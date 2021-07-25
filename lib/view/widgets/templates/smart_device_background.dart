// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/widgets.dart';

/// A widget with a transparent appbar to show the background of the device
class SmartDeviceBackground extends StatefulWidget {
  /// Creates a scaffold with an appbar and a gradient
  /// background based on [device]
  const SmartDeviceBackground({
    required SmartDeviceModel device,
    required List<IconData> icons,
    required List<Widget> children,
    Key? key,
  })  : _device = device,
        _icons = icons,
        _children = children,
        super(key: key);
  final SmartDeviceModel _device;
  final List<IconData> _icons;
  final List<Widget> _children;

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
    return Hero(
      tag: widget._device.name,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:
              BoxDecoration(gradient: widget._device.getBackgroundGradient()),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TransparentAppBar(
                title: MainTitle(text: widget._device.name),
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
