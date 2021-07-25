import 'package:flutter/material.dart';

/// A widget to display a styled text to use in app title
class MainTitle extends StatelessWidget {
  /// Create a title to generic uses
  const MainTitle({
    Key? key,
    required String text,
  })   : _text = text,
        super(key: key);
  final String _text;
  @override
  Widget build(BuildContext context) => Text(
        _text,
        style: Theme.of(context).textTheme.headline5,
      );
}
