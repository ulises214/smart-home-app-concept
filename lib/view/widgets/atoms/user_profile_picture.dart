// 🐦 Flutter imports:
import 'package:flutter/material.dart';

/// Widget to show the user picture and open a modal with user info
class UserProfilePicture extends StatelessWidget {
  /// Show the user profile picture
  const UserProfilePicture({
    Key? key,
    required double size,
  })   : _size = size,
        super(key: key);
  final double _size;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        'assets/pictures/fake_profile.jpeg',
        fit: BoxFit.cover,
        width: _size,
        height: _size,
      ),
    );
  }
}
