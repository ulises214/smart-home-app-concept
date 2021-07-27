// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/widgets.dart';
import 'package:walles_smart_home/view/widgets/templates/smart_device_background.dart';

import 'tabs/ac_air.dart';

/// A page to manage the properties of a smart ac
class SmartAcPage extends StatelessWidget {
  /// Creates a smart ac page
  const SmartAcPage({
    required SmartAC device,
    required Widget icon,
    Key? key,
  })  : _device = device,
        _icon = icon,
        super(key: key);

  final SmartAC _device;
  final Widget _icon;
  @override
  Widget build(BuildContext context) {
    final icons = [
      FontAwesomeIcons.clock,
      FontAwesomeIcons.lightSnowflake,
      FontAwesomeIcons.sun,
      FontAwesomeIcons.droplet,
    ];
    return SmartDeviceBackground(
      device: _device,
      icons: icons,
      icon: _icon,
      initialIndex: 1,
      children: [
        const Text('1'),
        SmartAcAirPage(device: _device),
        const Text('3'),
        const Text('4'),
      ],
    );
  }
}
