part of '../injects_container.provider.dart';

/// Clase create new password notifier
class CreateNewPasswordNotifier extends StateNotifier<CreateNewPasswordState> {
  /// Clase create new password notifier
  CreateNewPasswordNotifier({
    required CreateNewPasswordUC createNewPasswordUC,
    CreateNewPasswordState? initialState,
  }) : _createNewPasswordUC = createNewPasswordUC,
       super(initialState ?? const CreateNewPasswordState.initial());
  final CreateNewPasswordUC _createNewPasswordUC;

  /// Resetea el estado a inicial
  void reset() => state = const CreateNewPasswordState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> createNewPassword(String password) async {
    state = const CreateNewPasswordState.loading();
    final result = await _createNewPasswordUC(password: password);
    result.when(
      left: (error) =>
          state = CreateNewPasswordState.error(failureToString(error)),
      right: (id) => state = CreateNewPasswordState.data(id),
    );
  }
}
