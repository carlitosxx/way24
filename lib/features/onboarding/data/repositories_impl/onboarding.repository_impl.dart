import 'package:way24/core/failures/local_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/onboarding/data/datasources/local/onboarding.datasource.dart';
import 'package:way24/features/onboarding/domain/repositories/onboarding.repository.dart';

/// Implements onboarding repository
class OnboardingRepositoryImpl implements OnboardingRepository {
  /// Implements onboarding repository
  OnboardingRepositoryImpl({required this.sharepreferencesDataSource});

  /// instance onboarding datasource implements
  final OnboardingDatasourceImpl sharepreferencesDataSource;
  @override
  FutureEither<LocalFailure, bool> getOnboardingStatus() async {
    return sharepreferencesDataSource.getOnboardingStatus();
  }

  @override
  FutureEither<LocalFailure, void> saveSeenOnboarding() {
    return sharepreferencesDataSource.saveSeenOnboarding();
  }
}
