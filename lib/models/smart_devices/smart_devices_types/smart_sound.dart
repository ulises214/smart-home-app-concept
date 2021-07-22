import 'package:flutter/material.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';

import '../smart_device_model.dart';

/// A implementation of a smart sound from [SmartDeviceModel]
class SmartSound extends SmartDeviceModel {
  /// Creates a sound device
  const SmartSound({
    String name = 'Sound',
    Color color = WalleColors.blue,
    bool isActive = false,
  }) : super(
          color: color,
          name: name,
          type: SmartDeviceType.sound,
          isActive: isActive,
        );
}
