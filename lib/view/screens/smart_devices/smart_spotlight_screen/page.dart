// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:walles_smart_home/controllers/controllers.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view/widgets.dart';
import 'package:walles_smart_home/view/widgets/templates/smart_device_background.dart';

/// A page to manage the properties of a smart ac
class SmartSpotlightPage extends StatelessWidget {
  /// Creates a smart ac page
  const SmartSpotlightPage({
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
        final device = Get.find<SmartSpotlightController>(tag: _deviceId);
        return SmartDeviceBackground(
          icons: icons,
          icon: _icon,
          color: device.color,
          heroTag: device.id,
          title: device.name,
          children: const [
            Text('1'),
            Text('2'),
            Text('3'),
            Text('4'),
          ],
        );
      },
    );
  }
}
