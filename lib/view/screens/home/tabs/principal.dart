// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view/widgets.dart';

/// The first tab displayed in home screen
class HomeTabMain extends StatelessWidget {
  /// Display information about the main devices
  const HomeTabMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const UserAppBar(text: 'Hi, Walle'),
          const SizedBox(height: 32.0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  RoomDevicesList(),
                  RoomDevicesList(),
                  RoomDevicesList(),
                  RoomDevicesList(),
                  RoomDevicesList(),
                  RoomDevicesList(),
                  RoomDevicesList(),
                  RoomDevicesList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
