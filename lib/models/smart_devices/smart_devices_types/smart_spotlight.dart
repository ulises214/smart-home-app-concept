// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';
import '../smart_device_model.dart';

/// A implementation of a smart spotlight from [SmartDeviceModel]
class SmartSpotlight extends SmartDeviceModel {
  /// Creates a spotlight device
  const SmartSpotlight({
    String name = 'Spotlight',
    Color color = WalleDevicesColors.red,
    bool isActive = false,
  }) : super(
          color: color,
          name: name,
          type: SmartDeviceType.spotlight,
          isActive: isActive,
          icon: FontAwesomeIcons.lightbulb,
        );
  @override
  SmartSpotlight copyWith({
    bool? isActive,
    Color? color,
    String? name,
  }) =>
      SmartSpotlight(
        color: color ?? this.color,
        isActive: isActive ?? this.isActive,
        name: name ?? this.name,
      );
}
