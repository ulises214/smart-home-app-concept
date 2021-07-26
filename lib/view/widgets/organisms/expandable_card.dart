// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'expansion_tile.dart';

/// A card that can show his children when the title is tapped
class ExpandableCard extends StatelessWidget {
  /// Creates a card that can be expandible
  const ExpandableCard({
    required Widget title,
    required Widget body,
    Key? key,
    Widget? subTitle,
    bool initiallyExpanded = false,
  })  : _title = title,
        _subTitle = subTitle,
        _body = body,
        _initiallyExpanded = initiallyExpanded,
        super(key: key);
  final Widget _title;
  final Widget _body;
  final Widget? _subTitle;
  final bool _initiallyExpanded;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: CustomExpansionTile(
          initiallyExpanded: _initiallyExpanded,
          title: _title,
          icon: const Icon(CupertinoIcons.arrow_down_circle_fill),
          subtitle: _subTitle,
          child: _body,
        ),
      ),
    );
  }
}
