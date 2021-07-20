import 'package:walles_smart_home/models/models.dart';

/// This model represents a group of smart devices
///
/// This group is locates in a specific part of the home
class RoomModel {
  /// Creates a new representation of a room
  const RoomModel({
    required this.name,
    required this.devices,
  });

  /// Identification name for this room
  final String name;

  /// Devices belonging to this room
  final List<SmartDeviceModel> devices;
}
