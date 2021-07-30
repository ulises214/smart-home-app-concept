import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';
import 'package:walles_smart_home/view/widgets.dart';

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
    return ClipRRect(
      borderRadius: WalleColors.borderRadius,
      child: Container(
        color: _color.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                        activeColor: WalleColors.white,
                        onChanged: (v) => _onChanged?.call(
                          v
                              ? SmartDeviceState.powerOn
                              : SmartDeviceState.powerOff,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
