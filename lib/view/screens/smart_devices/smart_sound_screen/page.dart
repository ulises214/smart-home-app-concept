// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/widgets.dart';
import 'package:walles_smart_home/view/widgets/templates/smart_device_background.dart';

/// A page to manage the properties of a smart ac
class SmartSoundPage extends StatelessWidget {
  /// Creates a smart ac page
  const SmartSoundPage({
    Key? key,
    required SmartSound device,
    required Widget icon,
  })  : _device = device,
        _icon = icon,
        super(key: key);

  final SmartSound _device;
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
      children: const [
        Text('1'),
        Text('2'),
        Text('3'),
        Text('4'),
      ],
    );
  }
}
