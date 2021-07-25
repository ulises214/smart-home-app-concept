// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:walles_smart_home/controllers/controllers.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view/constants.dart';
import 'package:walles_smart_home/view/screens.dart';

void main() {
  Get..put(RoomsController())..put(UserPreferencesController());
  runApp(const SmartHomeApp());
}

/// The entry point of the application
class SmartHomeApp extends StatelessWidget {
  /// Creates the entry point of the application
  const SmartHomeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final theme = Get.find<UserPreferencesController>().theme;
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:
                theme == ThemeMode.dark ? Brightness.light : Brightness.dark,
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: WalleColors.lightTheme,
            darkTheme: WalleColors.darkTheme,
            themeMode: theme,
            title: 'SmartHome App',
            initialRoute: '/Home',
            routes: {
              '/Home': (_) => const HomePage(),
            },
          ),
        );
      },
    );
  }
}
