import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A card that can show his children when the title is tapped
class ExpandableCard extends StatefulWidget {
  /// Creates a card that can be expandible
  const ExpandableCard({
    Key? key,
    required Widget title,
    Widget? subTitle,
    required Widget body,
  })   : _title = title,
        _subTitle = subTitle,
        _body = body,
        super(key: key);
  final Widget _title;
  final Widget _body;
  final Widget? _subTitle;

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              trailing: _ExpandIcon(expanded: _expanded),
              title: widget._title,
              subtitle: widget._subTitle,
              onTap: () => setState(() => _expanded = !_expanded),
            ),
            _BuildBody(child: _expanded ? widget._body : Container())
          ],
        ),
      ),
    );
  }
}

class _ExpandIcon extends StatelessWidget {
  const _ExpandIcon({
    Key? key,
    required bool expanded,
  })   : _expanded = expanded,
        super(key: key);
  final bool _expanded;
  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: _expanded
            ? const Icon(
                CupertinoIcons.arrow_up_circle_fill,
                key: Key('Up'),
              )
            : const Icon(
                CupertinoIcons.arrow_down_circle_fill,
                key: Key('Down'),
              ),
      );
}

class _BuildBody extends StatelessWidget {
  const _BuildBody({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) => ClipRect(
          child: SlideTransition(
            position: Tween<Offset>(
              end: const Offset(0.0, 0.0),
              begin: const Offset(0.0, -1.0),
            ).animate(animation),
            child: child,
          ),
        ),
        child: child,
      );
}
