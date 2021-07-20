// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walles_smart_home/controllers/controllers.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view/widgets.dart';

/// The first tab displayed in home screen
class HomeTabMain extends StatelessWidget {
  /// Display information about the main devices
  const HomeTabMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rooms = Get.find<RoomsController>().rooms;
    return SafeArea(
      child: Column(
        children: [
          const UserAppBar(text: 'Hi, Walle'),
          const SizedBox(height: 32.0),
          Expanded(
              child: ListView.builder(
            itemCount: rooms.length,
            itemBuilder: (context, i) => RoomDevicesList(room: rooms[i]),
          )),
        ],
      ),
    );
  }
}
