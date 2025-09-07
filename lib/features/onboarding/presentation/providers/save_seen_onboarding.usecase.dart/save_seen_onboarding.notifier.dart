part of '../injects_container.provider.dart';

/// Notifier save seen onboarding
class SaveSeenOnboardingNotifier
    extends StateNotifier<SaveSeenOnboardingState> {
  /// Notifier save seen onboarding
  SaveSeenOnboardingNotifier({
    required SaveSeenOnboardingUC saveSeenOnboardingUC,
    SaveSeenOnboardingState? initialState,
  })  : _saveSeenOnboardingUC = saveSeenOnboardingUC,
        super(initialState ?? const SaveSeenOnboardingState.initial());
  final SaveSeenOnboardingUC _saveSeenOnboardingUC;

  /// Resetea el estado a inicial
  void reset() => state = const SaveSeenOnboardingState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> saveSeenOnboarding() async {
    state = const SaveSeenOnboardingState.loading();
    final result = await _saveSeenOnboardingUC();
    result.when(
      left: (error) =>
          state = SaveSeenOnboardingState.error(localFailureToString(error)),
      right: (response) => state = const SaveSeenOnboardingState.data(),
    );
  }
}
