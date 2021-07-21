import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'expansion_tile.dart';

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
        child: CustomExpansionTile(
          title: widget._title,
          icon: const Icon(CupertinoIcons.arrow_down_circle_fill),
          subtitle: widget._subTitle,
          child: widget._body,
        ),
      ),
    );
  }
}
