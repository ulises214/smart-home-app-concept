import 'package:flutter/material.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';

import '../smart_device_model.dart';

/// A implementation of a smart spotlight from [SmartDeviceModel]
class SmartSpotlight extends SmartDeviceModel {
  /// Creates a spotlight device
  const SmartSpotlight({
    String name = 'Spotlight',
    Color color = WalleColors.red,
    bool isActive = false,
  }) : super(
          color: color,
          name: name,
          type: SmartDeviceType.spotlight,
          isActive: isActive,
        );
}
