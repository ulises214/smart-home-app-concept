import 'dart:math' as math;
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
                Container(
                  width: c.maxWidth,
                  height: c.maxHeight,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [
                      Theme.of(context).cardColor.withOpacity(0.2),
                      Theme.of(context).cardColor.withOpacity(0.2),
                    ]),
                  ),
                ),
                _SemiCircleWidget(
                  diameter: c.maxHeight - 60,
                  sweepAngle:
                      (device.percentageTemperature * 1.8).clamp(0.0, 180.0),
                  color: device.color.getBackgroundByTheme(theme),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).cardColor.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                ),
                MainTitle(
                  text: '${device.currentTemp}°C',
                ),
              ],
            );
          }),
        ),
      );
    });
  }
}

class _SemiCircleWidget extends StatelessWidget {
  const _SemiCircleWidget({
    required this.sweepAngle,
    required this.color,
    this.diameter = 200,
    Key? key,
  }) : super(key: key);
  final double diameter;
  final double sweepAngle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _MyPainter(sweepAngle, color),
      size: Size(diameter, diameter),
    );
  }
}

class _MyPainter extends CustomPainter {
  _MyPainter(this.sweepAngle, this.color);
  final double? sweepAngle;
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 60.0
      ..style = PaintingStyle.stroke
      ..color = color!;

    double degToRad(double deg) => deg * (math.pi / 180.0);

    final path = Path()
      ..arcTo(
          // 4.
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height,
            width: size.width,
          ), // 5.
          degToRad(180),
          degToRad(sweepAngle!),
          false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
