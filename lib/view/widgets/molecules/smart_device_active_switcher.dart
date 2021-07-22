import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';

/// Card to show the active state of a smart device and open control screen
class SmartDeviceActiveSwitcher extends StatelessWidget {
  /// Creates a card to manage the active state of a [SmartDeviceModel]
  const SmartDeviceActiveSwitcher({
    Key? key,
    required SmartDeviceModel device,
  })   : _device = device,
        super(key: key);

  final SmartDeviceModel _device;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: _device.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [_getDeviceIcon(_device.type)],
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
        color: WalleColors.white,
      ),
    );
  }
}
