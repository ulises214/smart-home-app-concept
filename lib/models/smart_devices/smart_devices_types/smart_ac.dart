import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';

import '../smart_device_model.dart';

/// A implementation of a smart air air-conditioning from [SmartDeviceModel]
class SmartAC extends SmartDeviceModel {
  /// Creates a spotlight device
  const SmartAC({
    String name = 'AC',
    Color color = WalleColors.purple,
    bool isActive = false,
  }) : super(
          color: color,
          name: name,
          type: SmartDeviceType.ac,
          isActive: isActive,
          icon: FontAwesomeIcons.airConditioner,
        );
  @override
  SmartAC copyWith({
    bool? isActive,
    Color? color,
    String? name,
  }) =>
      SmartAC(
        color: color ?? this.color,
        isActive: isActive ?? this.isActive,
        name: name ?? this.name,
      );
}
