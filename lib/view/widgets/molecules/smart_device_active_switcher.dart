// 🎯 Dart imports:
import 'dart:math' as math;

// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers/controllers.dart';
import 'package:walles_smart_home/models/models.dart';
import 'package:walles_smart_home/view/constants.dart';
import 'package:walles_smart_home/view/screens.dart';
import 'package:walles_smart_home/view/utils.dart';
import 'package:walles_smart_home/view/widgets.dart';

/// Card to show the active state of a smart device and open control screen
class SmartDeviceActiveSwitcher extends StatelessWidget {
  /// Creates a card to manage the active state of a [SmartDeviceModel]
  const SmartDeviceActiveSwitcher({
    required GenericDeviceFinder deviceFinder,
    Key? key,
  })  : _deviceFinder = deviceFinder,
        super(key: key);

  final GenericDeviceFinder _deviceFinder;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final device = _deviceFinder.call();
      final isDarkTheme = Get.find<UserPreferencesController>().isDarkTheme;
      final cardColor =
          isDarkTheme ? device.color.getOpaque() : device.color.getShiny();
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: AnimatedContainer(
          duration: WalleColors.animationDuration,
          color:
              device.isActive ? cardColor : Theme.of(context).backgroundColor,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () => _goToDevicePage(
                device.icon,
                device.id,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: device.id,
                      child: _getDeviceIcon(device.icon),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BodyText('Smart'),
                          BodyText(device.name),
                        ],
                      ),
                    ),
                    CupertinoSwitch(
                      activeColor: device.color,
                      value: device.isActive,
                      onChanged: (_) => device.toggleActive(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  void _goToDevicePage(IconData icon, String id) {
    final iconWidget = _getDeviceIcon(icon, 24);
    switch (_deviceFinder.type) {
      case SmartDeviceType.ac:
        _pushPage(SmartAcPage(deviceId: id, icon: iconWidget));
        break;
      case SmartDeviceType.spotlight:
        _pushPage(SmartSpotlightPage(deviceId: id, icon: iconWidget));
        break;
      case SmartDeviceType.tv:
        _pushPage(SmartTVPage(deviceId: id, icon: iconWidget));
        break;
      case SmartDeviceType.sound:
        _pushPage(SmartSoundPage(deviceId: id, icon: iconWidget));
        break;
    }
  }

  void _pushPage(Widget page) {
    Get.to(() => page, transition: Transition.cupertino);
  }

  Widget _getDeviceIcon(IconData icon, [double? size]) {
    switch (_deviceFinder.type) {
      case SmartDeviceType.spotlight:
        return RotatedIcon(
          angle: math.pi,
          icon: icon,
          size: size,
        );
      default:
        return RotatedIcon(icon: icon, size: size);
    }
  }
}
