import 'package:flutter/material.dart';
import 'package:walles_smart_home/models/models.dart';

/// Page to control the smart ac in the air section
class SmartAcAirPage extends StatelessWidget {
  /// Creates a page to manage temp, speed, and power of a SmartAc
  const SmartAcAirPage({
    required SmartAC device,
    Key? key,
  })  : _device = device,
        super(key: key);

  final SmartAC _device;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
