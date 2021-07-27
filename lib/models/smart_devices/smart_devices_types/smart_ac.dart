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
  SmartAC({
    required String id,
    String name = 'AC',
    Color color = WalleDevicesColors.purple,
    SmartDeviceState initialState = SmartDeviceState.powerOff,
  }) : super(
          id: id,
          color: color,
          name: name,
          type: SmartDeviceType.ac,
          icon: FontAwesomeIcons.airConditioner,
          initialState: initialState,
        );
  @override
  SmartAC copyWith({
    Color? color,
    String? name,
  }) =>
      SmartAC(
        id: id,
        color: color ?? this.color,
        name: name ?? this.name,
        initialState: state,
      );
}
