// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
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
      // ignore: prefer_const_constructors
      RoomModel(name: 'Living Room', devices: [
        const SmartSpotlight(),
        const SmartAC(),
        const SmartTv(),
        const SmartSound(),
      ]),
    ];
  }

  /// Change the state of a device
  void changeDeviceState(int roomIndex, int deviceIndex, bool deviceState) {
    final selectedRoom = _rooms[roomIndex];
    final selectedDevice =
        selectedRoom.devices[deviceIndex].copyWith(isActive: deviceState);
    selectedRoom.devices[deviceIndex] = selectedDevice;
    _rooms[roomIndex] = selectedRoom;
  }
}
