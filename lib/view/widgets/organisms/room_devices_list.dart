// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/widgets.dart';

/// A widget that display the devices in a room
class RoomDevicesList extends StatelessWidget {
  /// Show a list of all devices cards of a room
  const RoomDevicesList({
    required RoomModel room,
    required Function(int deviceIdx, bool state) onDeviceActiveChange,
    Key? key,
    bool expanded = false,
  })  : _expanded = expanded,
        _onDeviceActiveChange = onDeviceActiveChange,
        _room = room,
        super(key: key);

  final bool _expanded;
  final RoomModel _room;
  final Function(int deviceIdx, bool state) _onDeviceActiveChange;
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
              device: _room.devices[i],
              onActiveChange: (v) => _onDeviceActiveChange(i, v),
            ),
          ),
        ),
      ),
    );
  }
}
