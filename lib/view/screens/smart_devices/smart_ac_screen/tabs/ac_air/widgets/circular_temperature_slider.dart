// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers.dart';
import 'package:walles_smart_home/models.dart';
import 'package:walles_smart_home/view.dart';

/// Creates a widget to manage [SmartACController] temperature
class CircularTemperatureSlider extends StatelessWidget {
  /// Creates a widget to manage the temperature
  const CircularTemperatureSlider({
    required ID deviceId,
    Key? key,
  })  : _deviceId = deviceId,
        super(key: key);

  final ID _deviceId;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final device = Get.find<SmartACController>(tag: _deviceId.value);
      final theme = Get.find<UserPreferencesController>().theme;
      return Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 250, maxHeight: 250),
          child: LayoutBuilder(builder: (_, c) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: c.maxHeight / 2,
                      decoration: BoxDecoration(
                        color: device.color.getBackgroundByTheme(theme),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(300),
                          topRight: Radius.circular(300),
                        ),
                      ),
                    ),
                    _BottomBackground(
                      height: c.maxHeight / 2,
                    ),
                  ],
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(300),
                      ),
                    ),
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 50),
                  child: MainTitle(
                    key: ValueKey<double>(device.currentTemp),
                    text: '${device.currentTemp}°C',
                  ),
                ),
              ],
            );
          }),
        ),
      );
    });
  }
}

class _BottomBackground extends StatelessWidget {
  const _BottomBackground({
    required this.height,
    Key? key,
  }) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(300),
          bottomRight: Radius.circular(300),
        ),
      ),
    );
  }
}
