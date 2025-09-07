import 'package:way24/core/failures/local_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/onboarding/domain/repositories/onboarding.repository.dart';

/// Use case
class SaveSeenOnboardingUC {
  /// Use case "save seen onboarding"
  SaveSeenOnboardingUC(this.repository);

  /// Param from repository
  final OnboardingRepository repository;

  /// Method auto callable
  FutureEither<LocalFailure, void> call() async {
    return repository.saveSeenOnboarding();
  }
}
