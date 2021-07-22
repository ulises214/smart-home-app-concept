import 'package:flutter/material.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';

import '../smart_device_model.dart';

/// A implementation of a smart tv from [SmartDeviceModel]
class SmartTv extends SmartDeviceModel {
  /// Creates a tv device
  const SmartTv({
    String name = 'TV',
    Color color = WalleColors.teal,
    bool isActive = false,
  }) : super(
          color: color,
          name: name,
          type: SmartDeviceType.tv,
          isActive: isActive,
        );
}
