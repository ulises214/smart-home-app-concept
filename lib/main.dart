import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SmartHomeApp());

class SmartHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartHome App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: CupertinoSwitch(value: true, onChanged: (onChanged) {}),
          ),
        ),
      ),
    );
  }
}
