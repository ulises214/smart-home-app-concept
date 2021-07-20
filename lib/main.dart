// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const SmartHomeApp());

/// The entry point of the application
class SmartHomeApp extends StatelessWidget {
  /// Creates the entry point of the application
  const SmartHomeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartHome App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: CupertinoSwitch(value: true, onChanged: (onChanged) {}),
        ),
      ),
    );
  }
}
