// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';

/// Represents a smart devices and this features.
abstract class SmartDeviceModel {
  /// Creates a new smart devices
  SmartDeviceModel({
    required this.id,
    required this.type,
    required this.name,
    required this.color,
    required this.icon,
    SmartDeviceState initialState = SmartDeviceState.powerOff,
  }) : _state = initialState;

  /// A unique is for this device
  final String id;

  /// Describes what type of devices are creating
  final SmartDeviceType type;

  /// Get the current state of this device
  SmartDeviceState get state => _state;

  /// Toggle the current state of a device
  void toggleState() {
    _state = _state == SmartDeviceState.powerOff
        ? SmartDeviceState.powerOn
        : SmartDeviceState.powerOff;
  }

  SmartDeviceState _state;

  /// Define if the device is active or not
  bool get isActive => _state == SmartDeviceState.powerOn;

  /// The name of the device
  final String name;

  /// The color used to widgets around of this device
  final Color color;

  /// The icon that represents the device
  final IconData icon;

  /// Creates a new object with all properties
  SmartDeviceModel copyWith({
    Color? color,
    String? name,
  });
}
