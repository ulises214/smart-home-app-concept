// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walles_smart_home/controllers.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models.dart';
import 'package:walles_smart_home/view.dart';

/// A widget to toggle the state of a Smart Device
class TurnOnOffDeviceCard extends StatelessWidget {
  /// Creates a card with a slider
  const TurnOnOffDeviceCard({
    required SmartDeviceState currentState,
    required Color selectedColor,
    Function(SmartDeviceState)? onChanged,
    Key? key,
  })  : _onChanged = onChanged,
        _currentState = currentState,
        _selectedColor = selectedColor,
        super(key: key);
  final Function(SmartDeviceState)? _onChanged;
  final SmartDeviceState _currentState;
  final Color _selectedColor;
  @override
  Widget build(BuildContext context) {
    final isOn = _currentState == SmartDeviceState.powerOn;
    return TransparentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BodyText('Power', bold: true),
          Expanded(
            child: Row(
              children: [
                BodyText(
                  'OFF',
                  textColor: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(isOn ? 0.5 : 1),
                ),
                const BodyText(' / '),
                BodyText(
                  'ON',
                  textColor: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(isOn ? 1 : 0.5),
                ),
                Obx(() {
                  final theme = Get.find<UserPreferencesController>().theme;
                  return Expanded(
                    child: CupertinoSwitch(
                      trackColor: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.5),
                      value: isOn,
                      activeColor: _selectedColor.getBackgroundByTheme(theme),
                      onChanged: (v) => _onChanged?.call(
                        v
                            ? SmartDeviceState.powerOn
                            : SmartDeviceState.powerOff,
                      ),
                    ),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
