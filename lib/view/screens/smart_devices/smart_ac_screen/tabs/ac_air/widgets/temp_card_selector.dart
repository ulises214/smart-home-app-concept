// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/widgets.dart';

/// A widget to select the temp of a [SmartAC]
class TempCardSelector extends StatelessWidget {
  /// Creates a card with a selector for the temp
  const TempCardSelector({
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
        return SliderCard(
          color: device.color,
          maxText: '${device.maxTemp}°C',
          minText: '${device.minTemp}°C',
          title: 'Temp',
          maxValue: device.maxTemp,
          minValue: device.minTemp,
          currentValue: device.currentTemp,
          onChanged: (t) => device.currentTemp = t,
        );
      },
    );
  }
}
