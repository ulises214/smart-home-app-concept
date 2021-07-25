// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers/controllers.dart';

/// The last tab displayed in home screen
class HomeTabUser extends StatelessWidget {
  /// Display information about the user account
  const HomeTabUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preferences = Get.find<UserPreferencesController>();
    return SafeArea(
      child: Obx(
        () => CupertinoSwitch(
          value: preferences.theme == ThemeMode.dark,
          onChanged: (value) => preferences.toggleTheme(),
        ),
      ),
    );
  }
}
