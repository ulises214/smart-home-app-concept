import 'package:flutter/material.dart';
import 'package:walles_smart_home/view/widgets.dart';

/// Widget to display a message and a icon with the user profile pic
class UserAppBar extends StatelessWidget {
  /// Creates a row with a message and a user profile pic
  const UserAppBar({
    Key? key,
    required String text,
  })   : _text = text,
        super(key: key);
  final String _text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBarTitle(text: _text),
        const UserProfilePicture(size: 36),
      ],
    );
  }
}
