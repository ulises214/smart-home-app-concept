// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models.dart';
import 'package:walles_smart_home/view.dart';

/// A widget to toggle the state of a Smart Device
class TurnOnOffDeviceCard extends StatelessWidget {
  /// Creates a card with a slider
  const TurnOnOffDeviceCard({
    required Color color,
    required SmartDeviceState currentState,
    Function(SmartDeviceState)? onChanged,
    Key? key,
  })  : _color = color,
        _onChanged = onChanged,
        _currentState = currentState,
        super(key: key);
  final Color _color;
  final Function(SmartDeviceState)? _onChanged;
  final SmartDeviceState _currentState;
  @override
  Widget build(BuildContext context) {
    final isOn = _currentState == SmartDeviceState.powerOn;
    return DeviceControlCard(
      color: _color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BodyText(
            'Power',
            bold: true,
            textColor: WalleColors.white,
          ),
          Expanded(
            child: Row(
              children: [
                BodyText(
                  'OFF',
                  textColor: WalleColors.white.withOpacity(isOn ? 0.5 : 1),
                ),
                const BodyText(' / ', textColor: WalleColors.white),
                BodyText(
                  'ON',
                  textColor: WalleColors.white.withOpacity(isOn ? 1 : 0.5),
                ),
                Expanded(
                  child: CupertinoSwitch(
                    trackColor: WalleColors.white.withOpacity(0.5),
                    value: isOn,
                    activeColor: WalleColors.white.withOpacity(0.8),
                    onChanged: (v) => _onChanged?.call(
                      v ? SmartDeviceState.powerOn : SmartDeviceState.powerOff,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
