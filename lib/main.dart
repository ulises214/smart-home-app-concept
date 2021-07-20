// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walles_smart_home/view/screens.dart';

void main() => runApp(const SmartHomeApp());

/// The entry point of the application
class SmartHomeApp extends StatelessWidget {
  /// Creates the entry point of the application
  const SmartHomeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartHome App',
      initialRoute: '/Home',
      routes: {
        '/Home': (_) => const HomePage(),
      },
    );
  }
}
