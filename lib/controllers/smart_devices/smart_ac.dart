part of smart_devices_controllers;

/// Creates a unique controller for a [SmartAC] object
class SmartACController extends SmartDeviceController {
  /// Initialize the smart ac
  SmartACController(SmartAC ac) : super(ac);

  SmartAC get _internalDevice => super._device.value as SmartAC;

  /// Get the max temp
  int get maxTemp => _internalDevice.maxTemp;

  /// Get the min temp
  int get minTemp => _internalDevice.minTemp;

  /// Gets the current value of the device
  int get currentTemp => _internalDevice.temp;

  /// Get the speed of the device
  SmartAcSpeed get speed => _internalDevice.speed;

  /// Change the current temp
  set currentTemp(int t) => _device.value = _internalDevice.copyWith(temp: t);

  /// Change the speed of the device
  set speed(SmartAcSpeed speed) =>
      _device.value = _internalDevice.copyWith(speed: speed);
}
