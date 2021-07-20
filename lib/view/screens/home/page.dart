// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:line_icons/line_icons.dart';

// 🌎 Project imports:
import 'tabs/tabs.dart';

/// The main screen displayed in the application
///
/// It shows main controllers and a navigation bar
class HomePage extends StatelessWidget {
  /// Creates the main view
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        body: _HomeBody(),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [HomeTabMain(), HomeTabEnergy(), HomeTabStats(), HomeTabUser()],
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorColor: Colors.transparent,
      tabs: [
        Tab(icon: Icon(LineIcons.home)),
        Tab(icon: Icon(LineIcons.lightningBolt)),
        Tab(icon: Icon(LineIcons.bars)),
        Tab(icon: Icon(LineIcons.user)),
      ],
    );
  }
}
