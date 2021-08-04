library smart_devices_controllers;

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';

part 'smart_ac.dart';
part 'smart_sound.dart';
part 'smart_spotlight.dart';
part 'smart_tv.dart';

/// Creates a unique controller for a [SmartSound] object
class SmartDeviceController extends GetxController {
  /// Initialize the smart ac
  SmartDeviceController(SmartDeviceModel ac) {
    _device = ac.obs;
  }
  late final Rx<SmartDeviceModel> _device;

  ///Gets the color of the device
  Color get color => _device.value.color;

  /// Check if the device is active
  bool get isActive => _device.value.isActive;

  /// Gets the current state of the device
  SmartDeviceState get state => _device.value.state;

  /// Gets the device id
  String get id => _device.value.id;

  /// Gets the device name
  String get name => _device.value.name;

  /// Gets the icon for the device
  IconData get icon => _device.value.icon;

  /// Toggle the current state of the device
  void toggleActive() {
    _device.value.toggleState();
    _device.value = _device.value.copyWith();
  }
}
