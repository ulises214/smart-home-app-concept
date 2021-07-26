// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

const Duration _kExpand = Duration(milliseconds: 200);

/// This is a modification of the widget [CustomExpansionTile]
class CustomExpansionTile extends StatefulWidget {
  /// Creates a card that can be expandible
  const CustomExpansionTile({
    required this.title,
    required this.child,
    required this.icon,
    Key? key,
    this.childPadding,
    this.subtitle,
    this.initiallyExpanded = false,
    this.maintainState = true,
    this.tilePadding,
    this.expandedIconColor,
  }) : super(key: key);

  /// The primary content of the list item.
  ///
  /// Typically a [Text] widget.
  final Widget title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// The widget that are displayed when the tile expands.
  ///
  /// Typically [ListTile] widgets.
  final Widget child;

  /// The widget to display in a rotating icon.
  final Widget icon;

  /// The color to set the icon when is expanded
  final Color? expandedIconColor;

  /// Specifies if the list tile is initially expanded
  /// (true) or collapsed (false, the default).
  final bool initiallyExpanded;

  /// Specifies whether the state of the children is
  /// maintained when the tile expands and collapses.
  ///
  /// When true, the children are kept in the tree while the tile is collapsed.
  /// When false (default), the children are
  /// removed from the tree when the tile is
  /// collapsed and recreated upon expansion.
  final bool maintainState;

  /// Specifies padding for the [ListTile].
  ///
  /// When the value is null, the tile's padding is
  /// `EdgeInsets.symmetric(horizontal: 16.0)`.
  final EdgeInsetsGeometry? tilePadding;

  /// Specifies padding for [child].
  final EdgeInsetsGeometry? childPadding;

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  late Animation<Color?> _headerColor;
  late Animation<Color?> _iconColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));

    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));

    _isExpanded = //PageStorage.of(context)?.readState(context) as bool? ??
        widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      //   PageStorage.of(context)?.writeState(context, _isExpanded);
    });
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTileTheme.merge(
          iconColor: _iconColor.value,
          textColor: _headerColor.value,
          child: ListTile(
            onTap: _handleTap,
            contentPadding: widget.tilePadding,
            title: widget.title,
            subtitle: widget.subtitle,
            trailing: RotationTransition(
              turns: _iconTurns,
              child: widget.icon,
            ),
          ),
        ),
        ClipRect(
          child: Align(
            alignment: Alignment.center,
            heightFactor: _heightFactor.value,
            child: Padding(
              padding: widget.childPadding ?? const EdgeInsets.all(16.0),
              child: child,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    final theme = Theme.of(context);
    _borderColorTween.end = theme.dividerColor;
    _headerColorTween
      ..begin = theme.textTheme.subtitle1!.color
      ..end = theme.accentColor;
    _iconColorTween
      ..begin = theme.unselectedWidgetColor
      ..end = widget.expandedIconColor ?? theme.accentColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final closed = !_isExpanded && _controller.isDismissed;
    final shouldRemoveChildren = closed && !widget.maintainState;

    final result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: EdgeInsets.zero,
          child: widget.child,
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}
