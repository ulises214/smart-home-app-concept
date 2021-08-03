import 'package:get/get.dart';
import 'package:walles_smart_home/models/models.dart';

/// Creates a unique controller for a [SmartAC] object
class SmartACController extends GetxController {
  /// Initialize the smart ac
  SmartACController(SmartAC ac) {
    _device = ac.obs;
  }
  late Rx<SmartAC> _device;
}
