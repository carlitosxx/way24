import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:way24/core/presentation/utils/failure_to_string.dart';
import 'package:way24/features/onboarding/data/datasources/local/onboarding.datasource.dart';
import 'package:way24/features/onboarding/data/repositories_impl/onboarding.repository_impl.dart';
import 'package:way24/features/onboarding/domain/repositories/onboarding.repository.dart';
import 'package:way24/features/onboarding/domain/usecases/get_onboarding_status.usecase.dart';
import 'package:way24/features/onboarding/domain/usecases/save_seen_onboarding.usecase.dart';
import 'package:way24/features/onboarding/presentation/providers/get_onboarding_status/get_onboarding_status.state.dart';
import 'package:way24/features/onboarding/presentation/providers/save_seen_onboarding.usecase.dart/save_seen_onboarding.state.dart';

part 'get_onboarding_status/get_onboarding_status.notifier.dart';
part 'save_seen_onboarding.usecase.dart/save_seen_onboarding.notifier.dart';
// * Repositories Inject

/// onboarding repository injection
final _onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  return OnboardingRepositoryImpl(
    sharepreferencesDataSource: OnboardingDatasourceImpl(
      SharedPreferences.getInstance(),
    ),
  );
});
// * Usecases Inject
/// use case getOnboardingStatus injection
final _getOnboardingStatusUC = Provider<GetOnboardingStatusUC>((ref) {
  final repository = ref.watch(_onboardingRepositoryProvider);
  return GetOnboardingStatusUC(repository);
});

/// use case saveSeenOmboarding injection
final _saveSeenOnboardingUC = Provider<SaveSeenOnboardingUC>((ref) {
  final repository = ref.watch(_onboardingRepositoryProvider);
  return SaveSeenOnboardingUC(repository);
});
// * State Notifier Providers
/// get onboarding status notifier provider
final getOnboardingStatusNotifierProvider =
    StateNotifierProvider<
      GetOnboardingStatusNotifier,
      GetOnboardingStatusState
    >(
      (ref) => GetOnboardingStatusNotifier(
        getOnboardingStatusUC: ref.watch(_getOnboardingStatusUC),
      )..getOnboardingStatus(),
    );

/// Save seen onboarding notifier provider
final saveSeenOnboardingNotifierProvider =
    StateNotifierProvider<SaveSeenOnboardingNotifier, SaveSeenOnboardingState>(
      (ref) => SaveSeenOnboardingNotifier(
        saveSeenOnboardingUC: ref.watch(_saveSeenOnboardingUC),
      ),
    );
