// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers.dart';
import 'package:walles_smart_home/models.dart';
import 'package:walles_smart_home/view.dart';

/// Creates a [TurnOnOffDeviceCard] for an [SmartACController]
class SmartACActiveSwitcher extends StatelessWidget {
  /// Creates a turn on/off widget
  const SmartACActiveSwitcher({
    required ID deviceID,
    Key? key,
  })  : _deviceID = deviceID,
        super(key: key);
  final ID _deviceID;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final device = Get.find<SmartACController>(tag: _deviceID.value);
        return TurnOnOffDeviceCard(
          currentState: device.state,
          onChanged: (_) => device.toggleActive(),
        );
      },
    );
  }
}
