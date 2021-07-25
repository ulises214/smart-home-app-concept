import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';
import 'package:walles_smart_home/view/widgets/atoms/body_text.dart';

/// Card to show the active state of a smart device and open control screen
class SmartDeviceActiveSwitcher extends StatefulWidget {
  /// Creates a card to manage the active state of a [SmartDeviceModel]
  const SmartDeviceActiveSwitcher({
    Key? key,
    required SmartDeviceModel device,
    required Function(bool) onActiveChange,
  })   : _device = device,
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
    final theme = Theme.of(context);
    final textColor = widget._device.isActive ? WalleColors.white : null;
    final iconColor = widget._device.isActive ? WalleColors.white : null;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Card(
          color: Color.lerp(
            Theme.of(context).backgroundColor,
            widget._device.color,
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
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconTheme(
                data: theme.iconTheme.copyWith(color: iconColor),
                child: _getDeviceIcon(widget._device.type),
              ),
              const SizedBox(height: 25),
              BodyText('Smart', textColor: textColor),
              BodyText(widget._device.name, textColor: textColor),
              Expanded(child: Container()),
              CupertinoSwitch(
                activeColor:
                    Color.lerp(widget._device.color, WalleColors.white, 1 / 3),
                value: widget._device.isActive,
                onChanged: _changeIsActive,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getDeviceIcon(SmartDeviceType type) {
    switch (type) {
      case SmartDeviceType.spotlight:
        return _RotatedIcon(angle: math.pi, icon: widget._device.icon);
      default:
        return _RotatedIcon(icon: widget._device.icon);
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
}

class _RotatedIcon extends StatelessWidget {
  const _RotatedIcon({
    Key? key,
    this.angle = 0,
    required this.icon,
  }) : super(key: key);
  final double angle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Icon(
        icon,
        size: 32.0,
      ),
    );
  }
}
