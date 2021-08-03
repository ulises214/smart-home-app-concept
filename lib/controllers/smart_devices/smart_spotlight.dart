import 'package:get/get.dart';
import 'package:walles_smart_home/models/models.dart';

/// Creates a unique controller for a [SmartSpotlight] object
class SmartSpotlightController extends GetxController {
  /// Initialize the smart ac
  SmartSpotlightController(SmartSpotlight ac) {
    _device = ac.obs;
  }
  late Rx<SmartSpotlight> _device;
}
