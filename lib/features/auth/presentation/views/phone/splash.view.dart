import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/router/routes.dart';
import 'package:way24/features/auth/presentation/providers/injects_container.provider.dart';
import 'package:way24/features/home/presentation/providers/injects_container.provider.dart';
// import 'package:way24/features/home/presentation/providers/injects_container.provider.dart';
import 'package:way24/features/onboarding/presentation/providers/injects_container.provider.dart';

/// Splash phone view
class SplashPhoneView extends ConsumerWidget {
  /// Splash phone view
  const SplashPhoneView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSessionState = ref.watch(getCurrentSessionNotifierProvider);
    final getOnboardingStatusState = ref.watch(
      getOnboardingStatusNotifierProvider,
    );
    ref.listen(getCurrentSessionNotifierProvider.select((value) => value), (
      previous,
      next,
    ) {
      next.whenOrNull(
        error: (message) {
          getOnboardingStatusState.maybeWhen(
            data: (status) {
              if (!status) {
                return OnBoardingRoute().go(context);
              }
              return SignInRoute().go(context);
            },
            orElse: () {},
          );
        },
        data: (user) {
          ref
              .read(getTouristPackagesNotifierProvider.notifier)
              .getTouristPackages(user.id);
          HomeRoute().go(context);
        },
      );
    });
    return Scaffold(
      body: Center(
        child: currentSessionState.maybeWhen(
          orElse: () => const Text('Loading'),
          data: (userEntity) => Text(userEntity.name),
        ),
      ),
    );
  }
}
