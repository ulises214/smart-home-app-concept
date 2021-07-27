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
  SmartSound({
    required String id,
    String name = 'Sound',
    Color color = WalleDevicesColors.blue,
    SmartDeviceState initialState = SmartDeviceState.powerOff,
  }) : super(
          id: id,
          color: color,
          name: name,
          type: SmartDeviceType.sound,
          icon: FontAwesomeIcons.speaker,
          initialState: initialState,
        );
  @override
  SmartSound copyWith({
    Color? color,
    String? name,
  }) =>
      SmartSound(
        id: id,
        color: color ?? this.color,
        name: name ?? this.name,
        initialState: state,
      );
}
