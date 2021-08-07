// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers/controllers.dart';
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
    final id1 = ID();
    final id2 = ID();
    final id3 = ID();
    final id4 = ID();
    final id5 = ID();
    final id6 = ID();
    final id7 = ID();
    final id8 = ID();

    Get
      ..lazyPut(() => SmartSpotlightController(SmartSpotlight(id1)),
          tag: id1.value)
      ..lazyPut(() => SmartACController(SmartAC(id2)), tag: id2.value)
      ..lazyPut(() => SmartTvController(SmartTv(id3)), tag: id3.value)
      ..lazyPut(() => SmartSoundController(SmartSound(id4)), tag: id4.value)
      ..lazyPut(() => SmartSpotlightController(SmartSpotlight(id5)),
          tag: id5.value)
      ..lazyPut(() => SmartSpotlightController(SmartSpotlight(id6)),
          tag: id6.value)
      ..lazyPut(() => SmartACController(SmartAC(id7)), tag: id7.value)
      ..lazyPut(() => SmartSoundController(SmartSound(id8)), tag: id8.value);
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
