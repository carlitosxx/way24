import 'package:way24/core/failures/local_failure.dart';
import 'package:way24/core/typedefs.dart';

/// Interface Onboarding repository
abstract interface class OnboardingRepository {
  /// Get Onboarding status
  FutureEither<LocalFailure, bool> getOnboardingStatus();

  /// Save seen of Onboarding
  FutureEither<LocalFailure, void> saveSeenOnboarding();
}
