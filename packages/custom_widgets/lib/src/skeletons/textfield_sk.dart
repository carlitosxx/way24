import 'package:flutter/material.dart';

/// Skeleton textfield
class SkeletonTextfield extends StatelessWidget {
  /// Skeleton textfield
  const SkeletonTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outlineVariant,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
