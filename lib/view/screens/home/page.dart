// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view/screens/home/tabs/tabs.dart';

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
      physics: BouncingScrollPhysics(),
      children: [
        _PageWithPadding(child: HomeTabMain()),
        _PageWithPadding(child: HomeTabEnergy()),
        _PageWithPadding(child: HomeTabStats()),
        _PageWithPadding(child: HomeTabUser()),
      ],
    );
  }
}

class _PageWithPadding extends StatefulWidget {
  const _PageWithPadding({
    required Widget child,
    Key? key,
  })  : _child = child,
        super(key: key);
  final Widget _child;

  @override
  __PageWithPaddingState createState() => __PageWithPaddingState();
}

class __PageWithPaddingState extends State<_PageWithPadding>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(24.0).copyWith(bottom: 0.0),
      child: widget._child,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: TabBar(
        indicatorColor: Colors.transparent,
        tabs: [
          Tab(icon: Icon(FontAwesomeIcons.solidHomeSimple)),
          Tab(icon: Icon(FontAwesomeIcons.solidBolt)),
          Tab(icon: Icon(FontAwesomeIcons.solidBarsSort)),
          Tab(icon: Icon(FontAwesomeIcons.solidUserAstronaut)),
        ],
      ),
    );
  }
}
