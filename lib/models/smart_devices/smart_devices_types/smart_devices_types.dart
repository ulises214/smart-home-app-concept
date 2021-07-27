/// Define the state of the smart device, can be on/off
enum SmartDeviceState {
  /// When the device is on
  powerOn,

  /// When the device is off
  powerOff,
}

/// Define what type of devices is describing
enum SmartDeviceType {
  /// describes a smart spotlight
  spotlight,

  /// Describes an air conditioner
  ac,

  /// Describes a smart tv
  tv,

  /// Describe a smart sound
  sound,
}
