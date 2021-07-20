// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:walles_smart_home/view/widgets.dart';

/// The first tab displayes in home screen
class HomeTabMain extends StatelessWidget {
  /// Display infomration about the main devices
  const HomeTabMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          UserAppBar(text: 'Hi, Walle'),
        ],
      ),
    );
  }
}
