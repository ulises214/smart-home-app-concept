// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';

const _minTemp = 16;
const _maxTemp = 30;
bool _isValidTemp(int temp) => temp >= _minTemp && temp <= _maxTemp;

/// A implementation of a smart air air-conditioning from [SmartDeviceModel]
class SmartAC extends SmartDeviceModel {
  /// Creates a spotlight device
  SmartAC(
    ID id, {
    String name = 'AC',
    Color color = WalleDevicesColors.purple,
    SmartDeviceState state = SmartDeviceState.powerOff,
    this.speed = SmartAcSpeed.sp1,
    this.temp = 20,
  })  : assert(_isValidTemp(temp)),
        super(
          id,
          color: color,
          name: name,
          type: SmartDeviceType.ac,
          icon: FontAwesomeIcons.airConditioner,
          state: state,
        );

  /// Defines the min temperature
  final int minTemp = _minTemp;

  /// Defines the max temperature
  final int maxTemp = _maxTemp;

  /// Gets the current temp
  final int temp;

  /// Gets the current speed
  final SmartAcSpeed speed;

  @override
  SmartAC copyWith({
    Color? color,
    int? temp,
    SmartAcSpeed? speed,
    SmartDeviceState? state,
    String? name,
  }) {
    return SmartAC(
      id,
      color: color ?? this.color,
      name: name ?? this.name,
      speed: speed ?? this.speed,
      state: state ?? this.state,
      temp: temp ?? this.temp,
    );
  }
}

const _icons = {
  SmartAcSpeed.sp1: FontAwesomeIcons.solid1,
  SmartAcSpeed.sp2: FontAwesomeIcons.solid2,
  SmartAcSpeed.sp3: FontAwesomeIcons.solid3,
};

/// Describes the speed of the smart ac
enum SmartAcSpeed {
  /// Speed 1
  sp1,

  /// Speed 2
  sp2,

  /// Speed 3
  sp3,
}

/// Utilities to this enum
extension SmartAcSpeedString on SmartAcSpeed {
  /// Get a less verbose string of the value
  IconData getIcon() => _icons[this]!;
}
