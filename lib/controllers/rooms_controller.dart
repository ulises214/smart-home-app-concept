// 📦 Package imports:
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:walles_smart_home/controllers/controllers.dart';

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
    final id1 = uuid.v4();
    final id2 = uuid.v4();
    final id3 = uuid.v4();
    final id4 = uuid.v4();
    final id5 = uuid.v4();
    final id6 = uuid.v4();
    final id7 = uuid.v4();
    final id8 = uuid.v4();

    Get
      ..lazyPut(() => SmartSpotlightController(SmartSpotlight(id: id1)),
          tag: id1)
      ..lazyPut(() => SmartACController(SmartAC(id: id2)), tag: id2)
      ..lazyPut(() => SmartTvController(SmartTv(id: id3)), tag: id3)
      ..lazyPut(() => SmartSoundController(SmartSound(id: id4)), tag: id4)
      ..lazyPut(() => SmartSpotlightController(SmartSpotlight(id: id5)),
          tag: id5)
      ..lazyPut(() => SmartSpotlightController(SmartSpotlight(id: id6)),
          tag: id6)
      ..lazyPut(() => SmartACController(SmartAC(id: id7)), tag: id7)
      ..lazyPut(() => SmartSoundController(SmartSound(id: id8)), tag: id8);
    _rooms.value = [
      RoomModel(name: 'Living Room', devices: [
        GenericDeviceFinder(SmartDeviceType.spotlight, id1),
        GenericDeviceFinder(SmartDeviceType.ac, id2),
        GenericDeviceFinder(SmartDeviceType.tv, id3),
        GenericDeviceFinder(SmartDeviceType.sound, id4),
      ]),
      RoomModel(name: 'Lecture room', devices: [
        GenericDeviceFinder(SmartDeviceType.spotlight, id5),
        GenericDeviceFinder(SmartDeviceType.spotlight, id6),
        GenericDeviceFinder(SmartDeviceType.ac, id7),
        GenericDeviceFinder(SmartDeviceType.sound, id8),
      ]),
    ];
  }
}
