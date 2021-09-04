// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walles_smart_home/controllers/user_preferences_controller.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view.dart';

/// A widget to select a value from a range
class SliderCard extends StatelessWidget {
  /// Creates a card with a slider
  const SliderCard({
    required double currentValue,
    required Color color,
    double minValue = 0,
    double maxValue = 10,
    String minText = '0',
    String maxText = '10',
    String title = 'Selector',
    Function(double)? onChanged,
    Key? key,
  })  : _currentValue = currentValue,
        _minValue = minValue,
        _maxValue = maxValue,
        _minText = minText,
        _maxText = maxText,
        _title = title,
        _color = color,
        _onChanged = onChanged,
        super(key: key);
  final double _minValue;
  final double _maxValue;
  final double _currentValue;
  final String _minText;
  final String _maxText;
  final String _title;
  final Color _color;
  final Function(double)? _onChanged;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final theme = Get.find<UserPreferencesController>().theme;
        return TransparentCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText(
                _title,
                bold: true,
              ),
              Expanded(
                child: Row(
                  children: [
                    BodyText(
                      _minText,
                    ),
                    Expanded(
                      child: CupertinoSlider(
                        activeColor: _color.getBackgroundByTheme(theme),
                        max: _maxValue.toDouble(),
                        min: _minValue.toDouble(),
                        value: _currentValue.toDouble(),
                        onChanged: _onChanged,
                      ),
                    ),
                    BodyText(
                      _maxText,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
