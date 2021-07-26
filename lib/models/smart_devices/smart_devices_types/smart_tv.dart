// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';
import '../smart_device_model.dart';

/// A implementation of a smart tv from [SmartDeviceModel]
class SmartTv extends SmartDeviceModel {
  /// Creates a tv device
  const SmartTv({
    String name = 'TV',
    Color color = WalleDevicesColors.teal,
    bool isActive = false,
  }) : super(
          color: color,
          name: name,
          type: SmartDeviceType.tv,
          isActive: isActive,
          icon: FontAwesomeIcons.tv,
        );

  @override
  SmartTv copyWith({
    bool? isActive,
    Color? color,
    String? name,
  }) =>
      SmartTv(
        color: color ?? this.color,
        isActive: isActive ?? this.isActive,
        name: name ?? this.name,
      );
}
