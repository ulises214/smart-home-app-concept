// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers/controllers.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/utils.dart';

/// Represents a smart devices and this features.
abstract class SmartDeviceModel {
  /// Creates a new smart devices
  const SmartDeviceModel({
    required this.type,
    required this.name,
    required this.color,
    required this.isActive,
    required this.icon,
  });

  /// Describes what type of devices are creating
  final SmartDeviceType type;

  /// The name of the device
  final String name;

  /// The color used to widgets around of this device
  final Color color;

  /// Define if the device is active or not, default is false
  final bool isActive;

  /// The icon that represents the device
  final IconData icon;

  /// Creates a new object with all properties
  SmartDeviceModel copyWith({bool? isActive, Color? color, String? name});
}
