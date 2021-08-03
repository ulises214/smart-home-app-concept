import 'package:get/get.dart';
import 'package:walles_smart_home/models/models.dart';

/// Creates a unique controller for a [SmartTv] object
class SmartTvController extends GetxController {
  /// Initialize the smart ac
  SmartTvController(SmartTv ac) {
    _device = ac.obs;
  }
  late Rx<SmartTv> _device;
}
