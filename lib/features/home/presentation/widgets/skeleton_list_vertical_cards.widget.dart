import 'package:flutter/material.dart';
import 'package:way24/core/presentation/theme/spacing.dart';

/// Skeleton list vertical cards
class SkeletonListVerticalCards extends StatelessWidget {
  /// Skeleton list vertical cards
  const SkeletonListVerticalCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          margin: const EdgeInsets.symmetric(
            horizontal: Spacing.spaceLarge,
            vertical: Spacing.spaceSmall,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        );
      },
    );
  }
}
