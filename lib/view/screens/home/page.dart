import 'package:flutter/material.dart';

/// The main screen displayed in the application
///
/// It shows main controllers and a navigation bar
class HomePage extends StatelessWidget {
  /// Creates the main view
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            Column(
              children: const [
                Text('AppBar'),
                Text('Main controllers'),
              ],
            ),
            Text('2'),
            Text('3'),
            Text('4'),
          ],
        ),
        bottomNavigationBar: Row(
          children: [
            const Text('Tabbbar 1'),
            const Text('Tabbbar 2'),
            const Text('Tabbbar 3'),
            const Text('Tabbbar 4'),
          ],
        ),
      ),
    );
  }
}
