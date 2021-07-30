import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walles_smart_home/view/constants.dart';
import 'package:walles_smart_home/view/widgets.dart';

/// A widget to select a value from a range
class SliderCard extends StatelessWidget {
  /// Creates a card with a slider
  const SliderCard({
    required Color color,
    required int currentValue,
    int minValue = 0,
    int maxValue = 10,
    String minText = '0',
    String maxText = '10',
    String title = 'Selector',
    Function(int)? onChanged,
    Key? key,
  })  : _color = color,
        _currentValue = currentValue,
        _minValue = minValue,
        _maxValue = maxValue,
        _minText = minText,
        _maxText = maxText,
        _title = title,
        _onChanged = onChanged,
        super(key: key);
  final Color _color;
  final int _minValue;
  final int _maxValue;
  final String _minText;
  final String _maxText;
  final String _title;
  final Function(int)? _onChanged;
  final int _currentValue;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: WalleColors.borderRadius,
      child: Container(
        color: _color.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText(_title, bold: true, textColor: WalleColors.white),
              Expanded(
                child: Row(
                  children: [
                    BodyText(_minText, textColor: WalleColors.white),
                    Expanded(
                      child: CupertinoSlider(
                        activeColor: WalleColors.white,
                        max: _maxValue.toDouble(),
                        min: _minValue.toDouble(),
                        value: _currentValue.toDouble(),
                        onChanged: (v) => _onChanged?.call(v.toInt()),
                      ),
                    ),
                    BodyText(_maxText, textColor: WalleColors.white),
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
