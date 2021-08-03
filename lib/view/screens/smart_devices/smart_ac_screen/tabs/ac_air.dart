// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers/controllers.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/widgets.dart';

/// Page to control the smart ac in the air section
class SmartAcAirPage extends StatefulWidget {
  /// Creates a page to manage temp, speed, and power of a SmartAc
  const SmartAcAirPage({
    required String deviceId,
    Key? key,
  })  : _deviceId = deviceId,
        super(key: key);

  final String _deviceId;

  @override
  _SmartAcAirPageState createState() => _SmartAcAirPageState();
}

class _SmartAcAirPageState extends State<SmartAcAirPage> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final device = Get.find<SmartACController>(tag: widget._deviceId);
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
                      color: device.color,
                      items:
                          SmartAcSpeed.values.map((e) => e.getIcon()).toList(),
                      onChange: (i) {
                        device.speed = SmartAcSpeed.values[i];
                      },
                      title: 'Speed',
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Flexible(
                    child: TurnOnOffDeviceCard(
                      color: device.color,
                      currentState: device.state,
                      onChanged: (s) {
                        device.toggleActive();
                        //   setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Flexible(
              child: TempCardSelector(
                device: device,
              ),
            ),
          ],
        );
      },
    );
  }
}
