import 'package:flutter/material.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/widgets.dart';
import 'package:walles_smart_home/view/widgets/templates/smart_device_background.dart';

/// A page to manage the properties of a smart tv
class SmartTVPage extends StatelessWidget {
  /// Creates a smart tv page
  const SmartTVPage({
    Key? key,
    required SmartTv device,
  })   : _device = device,
        super(key: key);

  final SmartTv _device;

  @override
  Widget build(BuildContext context) {
    return SmartDeviceBackground(
      device: _device,
      child: Container(),
    );
  }
}
