import 'package:flutter/material.dart';
import 'package:walles_smart_home/view/widgets.dart';

/// A widget that display the devices in a room
class RoomDevicesList extends StatelessWidget {
  /// Show a list of all devices cards of a room
  const RoomDevicesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ExpandableCard(
        title: const MainTitle(text: 'Living room'),
        subTitle: const SubTitle(text: '4 devices'),
        body: Column(
          children: const [Text('1'), Text('2'), Text('3')],
        ),
      ),
    );
  }
}
