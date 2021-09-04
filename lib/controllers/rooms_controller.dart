// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers.dart';
import 'package:walles_smart_home/models.dart';
import 'package:walles_smart_home/view/constants/colors.dart';

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
      ..lazyPut(
          () => SmartACController(
                SmartAC(id1, color: WalleDevicesColors.blue),
              ),
          tag: id1.value)
      ..lazyPut(
          () => SmartACController(
                SmartAC(id2, color: WalleDevicesColors.purple),
              ),
          tag: id2.value)
      ..lazyPut(
          () => SmartACController(
                SmartAC(id3, color: WalleDevicesColors.red),
              ),
          tag: id3.value)
      ..lazyPut(
          () => SmartACController(
                SmartAC(id4, color: WalleDevicesColors.teal),
              ),
          tag: id4.value)
      ..lazyPut(
          () => SmartACController(
                SmartAC(id5, color: WalleDevicesColors.blue),
              ),
          tag: id5.value)
      ..lazyPut(
          () => SmartACController(
                SmartAC(id6, color: WalleDevicesColors.purple),
              ),
          tag: id6.value)
      ..lazyPut(
          () => SmartACController(
                SmartAC(id7, color: WalleDevicesColors.red),
              ),
          tag: id7.value)
      ..lazyPut(
          () => SmartACController(
                SmartAC(id8, color: WalleDevicesColors.teal),
              ),
          tag: id8.value);
    _rooms.value = [
      RoomModel(name: 'Living Room', devices: [
        GenericDeviceFinder(SmartDeviceType.ac, id1),
        GenericDeviceFinder(SmartDeviceType.ac, id2),
        GenericDeviceFinder(SmartDeviceType.ac, id3),
        GenericDeviceFinder(SmartDeviceType.ac, id4),
      ]),
      RoomModel(name: 'Lecture room', devices: [
        GenericDeviceFinder(SmartDeviceType.ac, id5),
        GenericDeviceFinder(SmartDeviceType.ac, id6),
        GenericDeviceFinder(SmartDeviceType.ac, id7),
        GenericDeviceFinder(SmartDeviceType.ac, id8),
      ]),
    ];
  }
}
