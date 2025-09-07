part of '../injects_container.provider.dart';

/// Clase
class GetOnboardingStatusNotifier
    extends StateNotifier<GetOnboardingStatusState> {
  /// Constructor
  GetOnboardingStatusNotifier({
    required GetOnboardingStatusUC getOnboardingStatusUC,
    GetOnboardingStatusState? initialState,
  })  : _getOnboardingStatusUC = getOnboardingStatusUC,
        super(initialState ?? const GetOnboardingStatusState.initial());
  final GetOnboardingStatusUC _getOnboardingStatusUC;

  /// Resetea el estado a inicial
  void reset() => state = const GetOnboardingStatusState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> getOnboardingStatus() async {
    state = const GetOnboardingStatusState.loading();
    final result = await _getOnboardingStatusUC();
    result.when(
      left: (error) =>
          state = GetOnboardingStatusState.error(localFailureToString(error)),
      right: (response) => state = GetOnboardingStatusState.data(
        status: response,
      ),
    );
  }
}
