// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers.dart';
import 'package:walles_smart_home/view.dart';

/// The first tab displayed in home screen
class HomeTabMain extends StatefulWidget {
  /// Display information about the main devices
  const HomeTabMain({Key? key}) : super(key: key);

  @override
  _HomeTabMainState createState() => _HomeTabMainState();
}

class _HomeTabMainState extends State<HomeTabMain> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RoomsController>();
    return SafeArea(
      child: Column(
        children: [
          const UserAppBar(text: 'Hi, Walle'),
          const SizedBox(height: 32.0),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.rooms.length,
              itemBuilder: (context, i) => RoomDevicesList(
                room: controller.rooms[i],
                expanded: controller.rooms.length == 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
