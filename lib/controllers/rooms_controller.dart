// 📦 Package imports:
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

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
    final uuid = const Uuid();
    _rooms.value = [
      // ignore: prefer_const_constructors
      RoomModel(name: 'Living Room', devices: [
        SmartSpotlight(id: uuid.v4()),
        SmartAC(id: uuid.v4()),
        SmartTv(id: uuid.v4()),
        SmartSound(id: uuid.v4()),
      ]),
      RoomModel(name: 'Lecture room', devices: [
        SmartSpotlight(id: uuid.v4()),
        SmartSpotlight(id: uuid.v4()),
        SmartAC(id: uuid.v4()),
        SmartSound(id: uuid.v4()),
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
