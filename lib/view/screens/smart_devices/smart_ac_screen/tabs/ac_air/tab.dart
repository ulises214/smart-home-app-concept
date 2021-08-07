// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';

import 'widgets/active_switcher.dart';
import 'widgets/speed_card_radio.dart';
import 'widgets/temp_card_selector.dart';

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
        Flexible(flex: 3, child: Container()),
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
