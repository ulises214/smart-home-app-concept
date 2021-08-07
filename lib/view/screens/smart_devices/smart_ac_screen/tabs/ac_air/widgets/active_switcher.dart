import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walles_smart_home/controllers.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/widgets.dart';

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
          color: device.color,
          currentState: device.state,
          onChanged: (_) => device.toggleActive(),
        );
      },
    );
  }
}
