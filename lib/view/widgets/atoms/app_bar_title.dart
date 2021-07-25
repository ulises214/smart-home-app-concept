// 🐦 Flutter imports:
import 'package:flutter/material.dart';

/// The widget to use as simple app bar title
class AppBarTitle extends StatelessWidget {
  /// It provides the font size, color, and font
  /// family for a standard app bar title
  const AppBarTitle({
    Key? key,
    required String text,
  })   : _text = text,
        super(key: key);
  final String _text;
  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: Theme.of(context)
          .textTheme
          .headline4
          ?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
