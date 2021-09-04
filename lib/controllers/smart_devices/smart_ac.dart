part of smart_devices_controllers;

/// Creates a unique controller for a [SmartAC] object
class SmartACController extends SmartDeviceController {
  /// Initialize the smart ac
  SmartACController(SmartAC ac) : super(ac);

  SmartAC get _internalDevice => super._device.value as SmartAC;

  /// Get the max temp
  double get maxTemp => _internalDevice.maxTemp;

  /// Get the min temp
  double get minTemp => _internalDevice.minTemp;

  /// Gets the current value of the device
  double get currentTemp => _internalDevice.temp.toPrecision(1);

  /// Get the temperature in percentage in base of max and min temp
  double get percentageTemperature {
    // ? min -> 0%
    // ? max -> 100%
    // ? currentTemp -> ???
    final difference = maxTemp - minTemp;
    final currentValue = currentTemp - minTemp;
    // ? difference -> 100%
    return ((currentValue * 100) / difference).clamp(0, 100);
  }

  /// Get the speed of the device
  SmartAcSpeed get speed => _internalDevice.speed;

  /// Change the current temp
  set currentTemp(double t) =>
      _device.value = _internalDevice.copyWith(temp: t);

  /// Change the speed of the device
  set speed(SmartAcSpeed speed) =>
      _device.value = _internalDevice.copyWith(speed: speed);
}
