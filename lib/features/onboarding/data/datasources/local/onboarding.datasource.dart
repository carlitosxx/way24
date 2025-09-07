import 'package:shared_preferences/shared_preferences.dart';
import 'package:way24/core/either.dart';
import 'package:way24/core/failures/local_failure.dart';
import 'package:way24/core/typedefs.dart';

/// Datasource local
abstract interface class OnboardingDatasource {
  /// get status onboarding
  FutureEither<LocalFailure, bool> getOnboardingStatus();

  /// save seen onboarding
  FutureEither<LocalFailure, void> saveSeenOnboarding();
}

/// datasource local onboarding implementation
class OnboardingDatasourceImpl implements OnboardingDatasource {
  ///datasource local onboarding implementation
  OnboardingDatasourceImpl(this.sharedPreferences);

  /// sharedPreferences: provider of data persisted
  final Future<SharedPreferences> sharedPreferences;

  /// get status onboarding
  @override
  FutureEither<LocalFailure, bool> getOnboardingStatus() async {
    try {
      final prefs = await sharedPreferences;
      final hasSeenOnboarding = prefs.getBool('has_seen_onboarding') ?? false;
      return Either.right(hasSeenOnboarding);
    } catch (e) {
      return Either.left(LocalFailure.sharedPreferences());
    }
  }

  /// save seen onboarding
  @override
  FutureEither<LocalFailure, void> saveSeenOnboarding() async {
    try {
      final prefs = await sharedPreferences;
      await prefs.setBool('has_seen_onboarding', true);
      return Either.right(null);
    } catch (e) {
      return Either.left(LocalFailure.sharedPreferences());
    }
  }
}
