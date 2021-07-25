import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';
import 'package:walles_smart_home/view/widgets/atoms/body_text.dart';

/// Card to show the active state of a smart device and open control screen
class SmartDeviceActiveSwitcher extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = _device.isActive ? WalleColors.white : null;
    final iconColor = _device.isActive ? WalleColors.white : null;
    final cardColor = _device.isActive ? _device.color : null;
    return _Wrapper(
      cardColor: cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconTheme(
            data: theme.iconTheme.copyWith(color: iconColor),
            child: _getDeviceIcon(_device.type),
          ),
          const SizedBox(height: 25),
          BodyText('Smart', textColor: textColor),
          BodyText(_device.name, textColor: textColor),
          Expanded(child: Container()),
          CupertinoSwitch(
            activeColor: Color.lerp(_device.color, WalleColors.black, 1 / 3),
            value: _device.isActive,
            onChanged: _onActiveChange,
          ),
        ],
      ),
    );
  }

  Widget _getDeviceIcon(SmartDeviceType type) {
    switch (type) {
      case SmartDeviceType.spotlight:
        return const _RotatedIcon(
          angle: math.pi,
          icon: FontAwesomeIcons.lightbulb,
        );
      case SmartDeviceType.ac:
        return const _RotatedIcon(icon: FontAwesomeIcons.airConditioner);
      case SmartDeviceType.tv:
        return const _RotatedIcon(icon: FontAwesomeIcons.tv);
      case SmartDeviceType.sound:
        return const _RotatedIcon(icon: FontAwesomeIcons.speaker);
    }
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

class _Wrapper extends StatelessWidget {
  const _Wrapper({
    Key? key,
    required this.child,
    this.cardColor,
  }) : super(key: key);
  final Widget child;
  final Color? cardColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: cardColor ?? Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        duration: const Duration(milliseconds: 200),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
