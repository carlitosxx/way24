part of '../injects_container.provider.dart';

/// Clase
class CreateNewAccountNotifier extends StateNotifier<CreateNewAccountState> {
  /// Constructor
  CreateNewAccountNotifier({
    required CreateNewAccountUC createNewAccountUC,
    CreateNewAccountState? initialState,
  })  : _createNewAccountUC = createNewAccountUC,
        super(initialState ?? const CreateNewAccountState.initial());
  final CreateNewAccountUC _createNewAccountUC;

  /// Resetea el estado a inicial
  void reset() => state = const CreateNewAccountState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> createNewAccount(
    String firstName,
    String lastName,
    String email,
    String password,
    DateTime dateOfBirth,
  ) async {
    state = const CreateNewAccountState.loading();
    final result = await _createNewAccountUC(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      dateOfBirth: dateOfBirth,
    );
    result.when(
      left: (error) =>
          state = CreateNewAccountState.error(failureToString(error)),
      right: (response) => state = const CreateNewAccountState.data(),
    );
  }
}
