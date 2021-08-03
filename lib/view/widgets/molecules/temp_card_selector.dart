// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers/controllers.dart';
import 'package:walles_smart_home/models/models.dart';
import 'slider_card.dart';

/// A widget to select the temp of a [SmartAC]
class TempCardSelector extends StatelessWidget {
  /// Creates a card with a selector for the temp
  const TempCardSelector({
    required SmartACController device,
    Key? key,
  })  : _device = device,
        super(key: key);
  final SmartACController _device;
  @override
  Widget build(BuildContext context) {
    return SliderCard(
      color: _device.color,
      maxText: '${_device.maxTemp}°C',
      minText: '${_device.minTemp}°C',
      title: 'Temp',
      maxValue: _device.maxTemp,
      minValue: _device.minTemp,
      currentValue: _device.currentTemp,
      onChanged: (t) => _device.currentTemp = t,
    );
  }
}
