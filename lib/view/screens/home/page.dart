import 'package:flutter/material.dart';

/// The main screen displayed in the application
///
/// It shows main controllers and a navigation bar
class HomePage extends StatelessWidget {
  /// Creates the main view
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text('AppBar'),
          Text('Main controllers'),
        ],
      ),
      bottomNavigationBar: const Text('Tabbbar controller'),
    );
  }
}
