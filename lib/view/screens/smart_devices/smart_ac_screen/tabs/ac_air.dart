import 'package:flutter/material.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/widgets.dart';

/// Page to control the smart ac in the air section
class SmartAcAirPage extends StatefulWidget {
  /// Creates a page to manage temp, speed, and power of a SmartAc
  const SmartAcAirPage({
    required SmartAC device,
    Key? key,
  })  : _device = device,
        super(key: key);

  final SmartAC _device;

  @override
  _SmartAcAirPageState createState() => _SmartAcAirPageState();
}

class _SmartAcAirPageState extends State<SmartAcAirPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 3,
          child: Container(),
        ),
        Flexible(
          child: Row(
            children: [
              Flexible(
                child: Container(),
              ),
              Flexible(
                child: Container(),
              ),
            ],
          ),
        ),
        _createTempSelector(),
      ],
    );
  }

  Flexible _createTempSelector() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TempCardSelector(
          device: widget._device,
          onUpdate: onTemperatureChange,
        ),
      ),
    );
  }

  void onTemperatureChange(int t) {
    widget._device.temp = t;
    setState(() {});
  }
}
