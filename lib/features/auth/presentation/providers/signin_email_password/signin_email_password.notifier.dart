part of '../injects_container.provider.dart';

/// Clase
class SignInEmailPasswordNotifier
    extends StateNotifier<SignInEmailPasswordState> {
  /// Constructor
  SignInEmailPasswordNotifier({
    required SignInEmailPasswordUC signInEmailPasswordUC,
    SignInEmailPasswordState? initialState,
  })  : _signInEmailPasswordUC = signInEmailPasswordUC,
        super(initialState ?? const SignInEmailPasswordState.initial());
  final SignInEmailPasswordUC _signInEmailPasswordUC;

  /// Resetea el estado a inicial
  void reset() => state = const SignInEmailPasswordState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> signInEmailPassword(
    String email,
    String password,
  ) async {
    state = const SignInEmailPasswordState.loading();
    final result = await _signInEmailPasswordUC(
      email: email,
      password: password,
    );
    result.when(
      left: (error) =>
          state = SignInEmailPasswordState.error(failureToString(error)),
      right: (response) => state = SignInEmailPasswordState.data(
        user: response,
      ),
    );
  }
}
