import 'package:get/get.dart';
import 'package:walles_smart_home/models/models.dart';

/// The controller to manage the information about the rooms
class RoomsController extends GetxController {
  /// Initialize a random data to experiments
  RoomsController() {
    _randomInit();
  }
  final _rooms = RxList<RoomModel>();

  /// Only read the available rooms
  List<RoomModel> get rooms => _rooms;

  void _randomInit() {
    _rooms.value = [
      const RoomModel(name: 'Living Room', devices: [
        SmartDeviceModel(),
        SmartDeviceModel(),
        SmartDeviceModel(),
      ]),
      const RoomModel(name: 'Sala', devices: [
        SmartDeviceModel(),
        SmartDeviceModel(),
      ]),
      const RoomModel(name: 'Cuarto principal', devices: [
        SmartDeviceModel(),
        SmartDeviceModel(),
        SmartDeviceModel(),
        SmartDeviceModel(),
      ]),
    ];
  }
}
