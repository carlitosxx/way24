part of '../injects_container.provider.dart';

/// Clase
class LogoutNotifier extends StateNotifier<LogoutState> {
  /// Constructor
  LogoutNotifier({
    required LogoutUC logoutUC,
    LogoutState? initialState,
  })  : _logoutUC = logoutUC,
        super(initialState ?? const LogoutState.initial());
  final LogoutUC _logoutUC;

  /// Resetea el estado a inicial
  void reset() => state = const LogoutState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> logout() async {
    state = const LogoutState.loading();
    final result = await _logoutUC();
    result.when(
      left: (error) => state = LogoutState.error(failureToString(error)),
      right: (void _) => state = const LogoutState.data(),
    );
  }
}
