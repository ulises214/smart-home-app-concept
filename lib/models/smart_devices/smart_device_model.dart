import 'package:flutter/material.dart';
import 'package:walles_smart_home/models/models.dart';

/// Represents a smart devices and this features.
abstract class SmartDeviceModel {
  /// Creates a new smart devices
  const SmartDeviceModel({
    required this.type,
    required this.name,
    required this.color,
    required this.isActive,
  });

  /// Describes what type of devices are creating
  final SmartDeviceType type;

  /// The name of the device
  final String name;

  /// The color used to widgets around of this device
  final Color color;

  /// Define if the device is active or not, default is false
  final bool isActive;
}
