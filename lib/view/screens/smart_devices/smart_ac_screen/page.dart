// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers.dart';
import 'package:walles_smart_home/view.dart';
import 'tabs/smart_ac_tabs.dart';

/// A page to manage the properties of a smart ac
class SmartAcPage extends StatelessWidget {
  /// Creates a smart ac page
  const SmartAcPage({
    required String deviceId,
    required Widget icon,
    Key? key,
  })  : _deviceId = deviceId,
        _icon = icon,
        super(key: key);

  final String _deviceId;
  final Widget _icon;
  @override
  Widget build(BuildContext context) {
    final icons = [
      FontAwesomeIcons.clock,
      FontAwesomeIcons.lightSnowflake,
      FontAwesomeIcons.sun,
      FontAwesomeIcons.droplet,
    ];
    return Obx(
      () {
        final device = Get.find<SmartACController>(tag: _deviceId);
        return SmartDeviceBackground(
          color: device.color,
          heroTag: device.id.value,
          title: device.name,
          icons: icons,
          icon: _icon,
          initialIndex: 1,
          children: [
            const Text('1'),
            SmartAcAirPage(deviceId: device.id),
            const Text('3'),
            const Text('4'),
          ],
        );
      },
    );
  }
}
