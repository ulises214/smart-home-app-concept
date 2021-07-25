import 'package:flutter/material.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/widgets.dart';
import 'package:walles_smart_home/view/widgets/templates/smart_device_background.dart';

/// A page to manage the properties of a smart ac
class SmartSpotlightPage extends StatelessWidget {
  /// Creates a smart ac page
  const SmartSpotlightPage({
    Key? key,
    required SmartSpotlight device,
  })   : _device = device,
        super(key: key);

  final SmartSpotlight _device;

  @override
  Widget build(BuildContext context) {
    return SmartDeviceBackground(
      device: _device,
      child: Container(),
    );
  }
}
