import 'package:flutter/material.dart';

/// Class Widget Indicator
class DotIndicator extends StatelessWidget {
  /// Widget dot indicator of pageview
  const DotIndicator({
    super.key,
    this.isActive = false,
    this.color,
  });

  /// if isActive is true then the dot indicator change width size
  final bool isActive;

  /// color of the dot indicator
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
      width: isActive ? 16 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.onSurface,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
