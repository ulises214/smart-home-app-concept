// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';
import '../smart_device_model.dart';

/// A implementation of a smart sound from [SmartDeviceModel]
class SmartSound extends SmartDeviceModel {
  /// Creates a sound device
  const SmartSound({
    required String id,
    String name = 'Sound',
    Color color = WalleDevicesColors.blue,
    bool isActive = false,
  }) : super(
          id: id,
          color: color,
          name: name,
          type: SmartDeviceType.sound,
          isActive: isActive,
          icon: FontAwesomeIcons.speaker,
        );
  @override
  SmartSound copyWith({
    bool? isActive,
    Color? color,
    String? name,
  }) =>
      SmartSound(
        id: id,
        color: color ?? this.color,
        isActive: isActive ?? this.isActive,
        name: name ?? this.name,
      );
}
