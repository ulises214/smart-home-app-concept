import 'package:flutter/material.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/widgets.dart';

/// A widget with a transparent appbar to show the background of the device
class SmartDeviceBackground extends StatelessWidget {
  /// Creates a scaffold with an appbar and a gradient
  /// background based on [device]
  const SmartDeviceBackground({
    required SmartDeviceModel device,
    required Widget child,
    Key? key,
  })  : _device = device,
        _child = child,
        super(key: key);
  final SmartDeviceModel _device;
  final Widget _child;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _device.name,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: _device.getBackgroundGradient()),
          child: Column(
            children: [
              TransparentAppBar(
                title: MainTitle(text: _device.name),
              ),
              _child,
            ],
          ),
        ),
      ),
    );
  }
}
