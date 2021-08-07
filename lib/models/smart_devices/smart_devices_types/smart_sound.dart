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
  SmartSound(
    ID id, {
    String name = 'Sound',
    Color color = WalleDevicesColors.blue,
    SmartDeviceState state = SmartDeviceState.powerOff,
  }) : super(
          id,
          color: color,
          name: name,
          type: SmartDeviceType.sound,
          icon: FontAwesomeIcons.speaker,
          state: state,
        );
  @override
  SmartSound copyWith({
    Color? color,
    String? name,
    SmartDeviceState? state,
  }) =>
      SmartSound(
        id,
        color: color ?? this.color,
        name: name ?? this.name,
        state: state ?? this.state,
      );
}
