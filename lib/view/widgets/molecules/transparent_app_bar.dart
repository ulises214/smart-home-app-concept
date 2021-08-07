// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:walles_smart_home/view.dart';

/// A widget that looks like an appbar it has the same height and options
class TransparentAppBar extends StatelessWidget {
  /// Creates a transparent appbar
  const TransparentAppBar({
    required Widget title,
    Key? key,
  })  : _title = title,
        super(key: key);

  final Widget _title;
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return SizedBox(
      width: double.infinity,
      height: topPadding + kToolbarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0)
            .copyWith(top: topPadding),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
              left: 0,
              child: CustomBackButton(),
            ),
            _title,
          ],
        ),
      ),
    );
  }
}
