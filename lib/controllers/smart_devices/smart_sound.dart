import 'package:get/get.dart';
import 'package:walles_smart_home/models/models.dart';

/// Creates a unique controller for a [SmartSound] object
class SmartSoundController extends GetxController {
  /// Initialize the smart ac
  SmartSoundController(SmartSound ac) {
    _device = ac.obs;
  }
  late Rx<SmartSound> _device;
}
