import 'package:flutter/material.dart';

/// [NoGlowBehavior] is a custom scroll behavior that removes the glow effect.
class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
