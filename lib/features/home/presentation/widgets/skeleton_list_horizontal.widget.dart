import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:way24/core/presentation/theme/spacing.dart';

/// widget loading for the list categories
class SkeletonListHorizontalCircle extends StatelessWidget {
  /// widget loading for the list categories
  const SkeletonListHorizontalCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          width: 70,
          margin: EdgeInsets.only(
            left: (index == 0) ? Spacing.spaceLarge : Spacing.spaceMedium,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  shape: BoxShape.circle,
                ),
              ),
              const VerticalSpacerSmall(),
              Container(
                height: 12,
                padding: EdgeInsets.only(
                  left: (index == 0) ? Spacing.spaceLarge : Spacing.spaceMedium,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
              const VerticalSpacerSmall(),
            ],
          ),
        ),
      ),
    );
  }
}
