// 🎯 Dart imports:
import 'dart:math' as math;

// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walles_smart_home/controllers/controllers.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';
import 'package:walles_smart_home/view/screens.dart';
import 'package:walles_smart_home/view/widgets.dart';
import 'package:walles_smart_home/view/utils.dart';

/// Card to show the active state of a smart device and open control screen
class SmartDeviceActiveSwitcher extends StatefulWidget {
  /// Creates a card to manage the active state of a [SmartDeviceModel]
  const SmartDeviceActiveSwitcher({
    required SmartDeviceModel device,
    required Function(bool) onActiveChange,
    Key? key,
  })  : _device = device,
        _onActiveChange = onActiveChange,
        super(key: key);

  final SmartDeviceModel _device;
  final Function(bool) _onActiveChange;

  @override
  _SmartDeviceActiveSwitcherState createState() =>
      _SmartDeviceActiveSwitcherState();
}

class _SmartDeviceActiveSwitcherState extends State<SmartDeviceActiveSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: widget._device.isActive ? 1.0 : 0.0,
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
        final isDarkTheme = Get.find<UserPreferencesController>().isDarkTheme;
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final cardColor = isDarkTheme
                ? widget._device.color.getOpaque()
                : widget._device.color.getShiny();
            return Card(
              color: Color.lerp(
                Theme.of(context).backgroundColor,
                cardColor,
                _controller.value,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: child,
            );
          },
          child: InkWell(
            borderRadius: BorderRadius.circular(16.0),
            onTap: _goToDevicePage,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: widget._device.name,
                    child: _getDeviceIcon(),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BodyText('Smart'),
                        BodyText(widget._device.name),
                      ],
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: widget._device.color,
                    value: widget._device.isActive,
                    onChanged: _changeIsActive,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getDeviceIcon([double? size]) {
    switch (widget._device.type) {
      case SmartDeviceType.spotlight:
        return RotatedIcon(
          angle: math.pi,
          icon: widget._device.icon,
          size: size,
        );
      default:
        return RotatedIcon(icon: widget._device.icon, size: size);
    }
  }

  void _changeIsActive(bool value) {
    if (value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    widget._onActiveChange(value);
  }

  void _pushPage(Widget page) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  void _goToDevicePage() {
    final icon = _getDeviceIcon(24);
    switch (widget._device.type) {
      case SmartDeviceType.ac:
        _pushPage(SmartAcPage(device: widget._device as SmartAC, icon: icon));
        break;
      case SmartDeviceType.spotlight:
        _pushPage(SmartSpotlightPage(
            device: widget._device as SmartSpotlight, icon: icon));
        break;
      case SmartDeviceType.tv:
        _pushPage(SmartTVPage(device: widget._device as SmartTv, icon: icon));
        break;
      case SmartDeviceType.sound:
        _pushPage(
            SmartSoundPage(device: widget._device as SmartSound, icon: icon));
        break;
    }
  }
}
