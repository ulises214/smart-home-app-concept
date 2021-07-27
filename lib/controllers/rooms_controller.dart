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
    const uuid = Uuid();
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

  /// Toggle the state of a device
  void toggleDeviceState(int roomIndex, int deviceIndex) {
    final selectedRoom = _rooms[roomIndex];
    final selectedDevice = selectedRoom.devices[deviceIndex]..toggleState();
    selectedRoom.devices[deviceIndex] = selectedDevice;
    _rooms[roomIndex] = selectedRoom;
  }
}
