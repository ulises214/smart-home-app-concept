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
  SmartTv(
    ID id, {
    String name = 'TV',
    Color color = WalleDevicesColors.teal,
    SmartDeviceState state = SmartDeviceState.powerOff,
  }) : super(
          id,
          color: color,
          name: name,
          type: SmartDeviceType.tv,
          icon: FontAwesomeIcons.tv,
          state: state,
        );

  @override
  SmartTv copyWith({
    Color? color,
    String? name,
    SmartDeviceState? state,
  }) =>
      SmartTv(
        id,
        color: color ?? this.color,
        name: name ?? this.name,
        state: state ?? this.state,
      );
}
