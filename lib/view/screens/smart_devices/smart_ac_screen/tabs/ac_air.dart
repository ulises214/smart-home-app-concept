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
                child: ControlRadioCard(
                  color: widget._device.color,
                  items: SmartAcSpeed.values.map((e) => e.getIcon()).toList(),
                  onChange: (i) {
                    widget._device.speed = SmartAcSpeed.values[i];
                  },
                  title: 'Speed',
                ),
              ),
              const SizedBox(width: 10.0),
              Flexible(
                child: TurnOnOffDeviceCard(
                  color: widget._device.color,
                  currentState: widget._device.state,
                  onChanged: (s) {
                    widget._device.toggleState();
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        _createTempSelector(),
      ],
    );
  }

  Flexible _createTempSelector() {
    return Flexible(
      child: TempCardSelector(
        device: widget._device,
        onUpdate: onTemperatureChange,
      ),
    );
  }

  void onTemperatureChange(int t) {
    widget._device.temp = t;
    setState(() {});
  }
}
