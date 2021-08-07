// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models.dart';

/// Represents a smart devices and this features.
abstract class SmartDeviceModel {
  /// Creates a new smart devices
  SmartDeviceModel(
    this.id, {
    required this.type,
    required this.name,
    required this.color,
    required this.icon,
    this.state = SmartDeviceState.powerOff,
  });

  /// A unique is for this device
  final ID id;

  /// Describes what type of devices are creating
  final SmartDeviceType type;

  /// Get the current state of this device
  final SmartDeviceState state;

  /// Define if the device is active or not
  bool get isActive => state == SmartDeviceState.powerOn;

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
    SmartDeviceState? state,
  });
}
