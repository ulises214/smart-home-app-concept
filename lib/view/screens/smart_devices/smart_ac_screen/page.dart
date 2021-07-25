// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/widgets.dart';
import 'package:walles_smart_home/view/widgets/templates/smart_device_background.dart';

/// A page to manage the properties of a smart ac
class SmartAcPage extends StatelessWidget {
  /// Creates a smart ac page
  const SmartAcPage({
    Key? key,
    required SmartAC device,
  })  : _device = device,
        super(key: key);

  final SmartAC _device;
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
      children: const [
        Text('1'),
        Text('2'),
        Text('3'),
        Text('4'),
      ],
    );
  }
}
