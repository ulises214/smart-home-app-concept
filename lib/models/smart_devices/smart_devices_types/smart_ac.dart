// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';
import '../smart_device_model.dart';

const _minTemp = 16;
const _maxTemp = 30;
bool _isValidTemp(int temp) => temp >= _minTemp && temp <= _maxTemp;

/// A implementation of a smart air air-conditioning from [SmartDeviceModel]
class SmartAC extends SmartDeviceModel {
  /// Creates a spotlight device
  SmartAC({
    required String id,
    String name = 'AC',
    Color color = WalleDevicesColors.purple,
    SmartDeviceState initialState = SmartDeviceState.powerOff,
    SmartAcSpeed initialSpeed = SmartAcSpeed.sp1,
    int initialTemp = 20,
  })  : assert(_isValidTemp(initialTemp)),
        _speed = initialSpeed,
        _temp = initialTemp,
        super(
          id: id,
          color: color,
          name: name,
          type: SmartDeviceType.ac,
          icon: FontAwesomeIcons.airConditioner,
          initialState: initialState,
        );

  /// Defines the min temperature
  final int minTemp = _minTemp;

  /// Defines the max temperature
  final int maxTemp = _maxTemp;

  int _temp;

  /// Gets the current temp
  int get temp => _temp;

  /// Set a new valid temp
  set temp(int newTemp) {
    assert(_isValidTemp(newTemp));
    _temp = newTemp;
  }

  SmartAcSpeed _speed;

  /// Get the current speed
  SmartAcSpeed get speed => _speed;

  /// Change current speed
  set speed(SmartAcSpeed newSpeed) {
    if (newSpeed == _speed) return;
    _speed = newSpeed;
  }

  @override
  SmartAC copyWith({Color? color, String? name}) => SmartAC(
        id: id,
        color: color ?? this.color,
        name: name ?? this.name,
        initialState: state,
      );
}

const _shortString = {
  SmartAcSpeed.sp1: '1',
  SmartAcSpeed.sp2: '2',
  SmartAcSpeed.sp3: '3'
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
  String toShortString() => _shortString[this]!;
}
