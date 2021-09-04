// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models.dart';
import 'widgets/widgets.dart';

/// Page to control the smart ac in the air section
class SmartAcAirPage extends StatelessWidget {
  /// Creates a page to manage temp, speed, and power of a SmartAc
  const SmartAcAirPage({
    required ID deviceId,
    Key? key,
  })  : _deviceId = deviceId,
        super(key: key);

  final ID _deviceId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: CircularTemperatureSlider(deviceId: _deviceId),
        ),
        const SizedBox(height: 10.0),
        Flexible(
          child: Row(
            children: [
              Flexible(
                child: SpeedRadioCard(deviceID: _deviceId),
              ),
              const SizedBox(width: 10.0),
              Flexible(
                child: SmartACActiveSwitcher(deviceID: _deviceId),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Flexible(
          child: TempCardSelector(deviceID: _deviceId),
        ),
      ],
    );
  }
}
