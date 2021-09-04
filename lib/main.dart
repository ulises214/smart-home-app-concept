// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/controllers.dart';
import 'package:walles_smart_home/view.dart';

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
        final themeMode = Get.find<UserPreferencesController>().theme;
        final isDarkTheme = Get.find<UserPreferencesController>().isDarkTheme;
        final currentTheme =
            isDarkTheme ? WalleColors.darkTheme : WalleColors.lightTheme;
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:
                isDarkTheme ? Brightness.light : Brightness.dark,
            systemNavigationBarColor: currentTheme.scaffoldBackgroundColor,
            systemNavigationBarIconBrightness:
                isDarkTheme ? Brightness.light : Brightness.dark,
          ),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: WalleColors.lightTheme,
            darkTheme: WalleColors.darkTheme,
            themeMode: themeMode,
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
