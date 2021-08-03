// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers/controllers.dart';
import 'package:walles_smart_home/models/models.dart';

/// Creates a class that can find the correct controller
class GenericDeviceFinder {
  /// Initialize
  GenericDeviceFinder(this._type, this._id);
  final SmartDeviceType _type;
  final String _id;

  /// Gets the type of this device
  SmartDeviceType get type => _type;

  /// Gets the device id
  String get id => _id;

  T _findInternal<T extends SmartDeviceController>() => Get.find<T>(tag: _id);

  /// Find the correct controller
  SmartDeviceController call() {
    switch (_type) {
      case SmartDeviceType.ac:
        return _findInternal<SmartACController>();
      case SmartDeviceType.sound:
        return _findInternal<SmartSoundController>();
      case SmartDeviceType.spotlight:
        return _findInternal<SmartSpotlightController>();
      case SmartDeviceType.tv:
        return _findInternal<SmartTvController>();
    }
  }
}
