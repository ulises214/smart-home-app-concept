// 🐦 Flutter imports:
import 'package:flutter/material.dart';

/// A widget to display a styled text to use in app subtitle
class SubTitle extends StatelessWidget {
  /// Create a subtitle to generic uses
  const SubTitle({
    Key? key,
    required String text,
  })   : _text = text,
        super(key: key);
  final String _text;
  @override
  Widget build(BuildContext context) => Text(
        _text,
        style: Theme.of(context).textTheme.headline6,
      );
}
