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
    return Column(
      children: [
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.red,
          ),
        ),
        Flexible(
          flex: 1,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.purpleAccent,
          ),
        ),
      ],
    );
  }
}
