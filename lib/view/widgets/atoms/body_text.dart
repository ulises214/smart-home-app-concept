// 🐦 Flutter imports:
import 'package:flutter/material.dart';

/// Widget to standard body text
class BodyText extends StatelessWidget {
  /// Creates a styles body text
  const BodyText(
    this._text, {
    Key? key,
    Color? textColor,
  })  : _textColor = textColor,
        super(key: key);

  final String _text;
  final Color? _textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(color: _textColor),
    );
  }
}
