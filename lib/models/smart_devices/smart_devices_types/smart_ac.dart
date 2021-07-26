// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';
import '../smart_device_model.dart';

/// A implementation of a smart air air-conditioning from [SmartDeviceModel]
class SmartAC extends SmartDeviceModel {
  /// Creates a spotlight device
  const SmartAC({
    required String id,
    String name = 'AC',
    Color color = WalleDevicesColors.purple,
    bool isActive = false,
  }) : super(
          id: id,
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
        id: id,
        color: color ?? this.color,
        isActive: isActive ?? this.isActive,
        name: name ?? this.name,
      );
}
