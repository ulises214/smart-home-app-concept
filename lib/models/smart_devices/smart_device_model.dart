import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walles_smart_home/controllers/controllers.dart';
import 'package:walles_smart_home/models/models.dart';

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

  /// Get a linear gradient based on the color specified in the props
  LinearGradient getBackgroundGradient([Axis direction = Axis.vertical]) {
    final theme = Get.find<UserPreferencesController>().theme;
    return LinearGradient(
      colors: theme == ThemeMode.light
          ? [
              Color.lerp(Colors.white, color, 0.3)!,
              Color.lerp(Colors.white, color, 0.7)!,
            ]
          : [
              Color.lerp(
                  Color.lerp(Colors.grey, Colors.black, 0.4), color, 0.7)!,
              Color.lerp(Colors.black, color, 0.25)!,
            ],
      begin: direction == Axis.horizontal
          ? Alignment.centerLeft
          : Alignment.topCenter,
      end: direction == Axis.horizontal
          ? Alignment.centerRight
          : Alignment.bottomCenter,
    );
  }

  /// Creates a new object with all properties
  SmartDeviceModel copyWith({bool? isActive, Color? color, String? name});
}
