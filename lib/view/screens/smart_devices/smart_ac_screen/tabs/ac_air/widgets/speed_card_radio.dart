// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers.dart';
import 'package:walles_smart_home/models.dart';
import 'package:walles_smart_home/view.dart';

/// Creates a [ControlRadioCard] to manage the speed of a [SmartACController]
class SpeedRadioCard extends StatelessWidget {
  /// Creates a radio switcher
  const SpeedRadioCard({required ID deviceID, Key? key})
      : _deviceID = deviceID,
        super(key: key);
  final ID _deviceID;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final device = Get.find<SmartACController>(tag: _deviceID.value);
        return ControlRadioCard(
          currentIndex: SmartAcSpeed.values.indexOf(device.speed),
          color: device.color,
          items: SmartAcSpeed.values.map((e) => e.getIcon()).toList(),
          onChange: (i) {
            device.speed = SmartAcSpeed.values[i];
          },
          title: 'Speed',
        );
      },
    );
  }
}
