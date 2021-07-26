// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';

/// This model represents a group of smart devices
///
/// This group is locates in a specific part of the home
class RoomModel {
  /// Creates a new representation of a room
  const RoomModel({
    required String name,
    required List<SmartDeviceModel> devices,
  })  : _name = name,
        _devices = devices;

  final String _name;
  final List<SmartDeviceModel> _devices;

  /// Identification name for this room
  String get name => _name;

  /// Devices belonging to this room
  List<SmartDeviceModel> get devices => _devices;
}
