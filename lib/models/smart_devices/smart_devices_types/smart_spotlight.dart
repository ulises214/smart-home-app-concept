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
  SmartSpotlight({
    required String id,
    String name = 'Spotlight',
    Color color = WalleDevicesColors.red,
    SmartDeviceState initialState = SmartDeviceState.powerOff,
  }) : super(
          id: id,
          color: color,
          name: name,
          type: SmartDeviceType.spotlight,
          icon: FontAwesomeIcons.lightbulb,
          initialState: initialState,
        );
  @override
  SmartSpotlight copyWith({
    Color? color,
    String? name,
  }) =>
      SmartSpotlight(
        id: id,
        color: color ?? this.color,
        name: name ?? this.name,
        initialState: state,
      );
}
