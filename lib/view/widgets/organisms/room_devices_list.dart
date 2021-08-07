// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models.dart';
import 'package:walles_smart_home/view/widgets.dart';

/// A widget that display the devices in a room
class RoomDevicesList extends StatelessWidget {
  /// Show a list of all devices cards of a room
  const RoomDevicesList({
    required RoomModel room,
    Key? key,
    bool expanded = false,
  })  : _expanded = expanded,
        _room = room,
        super(key: key);

  final bool _expanded;
  final RoomModel _room;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ExpandableCard(
        title: MainTitle(text: _room.name),
        subTitle: SubTitle(text: '${_room.devices.length} devices'),
        initiallyExpanded: _expanded,
        body: GridView.count(
          childAspectRatio: 1 / 1.25,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          crossAxisCount: 2,
          children: List.generate(
            _room.devices.length,
            (i) => SmartDeviceActiveSwitcher(
              deviceFinder: _room.devices[i],
            ),
          ),
        ),
      ),
    );
  }
}
