import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

import 'package:way24/features/onboarding/presentation/models/onboard.model.dart';

/// Class onBoarding content
class OnboardingContent extends StatelessWidget {
  /// Widget onboard content
  const OnboardingContent({required this.onboard, super.key});

  /// property onboard model;
  final Onboard onboard;

  ///
  // final double currentPage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            onboard.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        const VerticalSpacerSmall(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            onboard.message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
