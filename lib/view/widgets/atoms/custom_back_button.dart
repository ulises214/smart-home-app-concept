import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A widget to back button, used in an appbar
class CustomBackButton extends StatelessWidget {
  /// Creates a back button with different icon
  const CustomBackButton({
    Key? key,
    Color? color,
    VoidCallback? onPressed,
  })  : _color = color,
        _onPressed = onPressed,
        super(key: key);
  final Color? _color;
  final VoidCallback? _onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(FontAwesomeIcons.arrowLeftLong),
      color: _color,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        if (_onPressed != null) {
          _onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}
