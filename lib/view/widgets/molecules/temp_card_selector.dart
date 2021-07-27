import 'package:flutter/material.dart';
import 'package:walles_smart_home/models/models.dart';

import 'slider_card.dart';

/// A widget to select the temp of a [SmartAC]
class TempCardSelector extends StatelessWidget {
  /// Creates a card with a selector for the temp
  const TempCardSelector({
    required SmartAC device,
    required Function(int t) onUpdate,
    Key? key,
  })  : _onUpdate = onUpdate,
        _device = device,
        super(key: key);
  final SmartAC _device;
  final Function(int t) _onUpdate;
  @override
  Widget build(BuildContext context) {
    return SliderCard(
      color: _device.color,
      maxText: '${_device.maxTemp}°C',
      minText: '${_device.minTemp}°C',
      title: 'Temp',
      maxValue: _device.maxTemp,
      minValue: _device.minTemp,
      currentValue: _device.temp,
      onChanged: _onUpdate,
    );
  }
}
