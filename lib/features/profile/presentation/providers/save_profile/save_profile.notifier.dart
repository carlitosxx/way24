part of '../injects_container.provider.dart';

/// Clase
class SaveProfileNotifier extends StateNotifier<SaveProfileState> {
  /// Constructor
  SaveProfileNotifier({
    required SaveProfileUC saveProfileUC,
    SaveProfileState? initialState,
  })  : _saveProfileUC = saveProfileUC,
        super(initialState ?? const SaveProfileState.initial());
  final SaveProfileUC _saveProfileUC;

  /// Resetea el estado a inicial
  void reset() => state = const SaveProfileState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> saveProfile(
    String firstName,
    String lastName,
  ) async {
    state = const SaveProfileState.loading();
    final result = await _saveProfileUC(
      firstName: firstName,
      lastName: lastName,
    );
    result.when(
      left: (error) => state = SaveProfileState.error(failureToString(error)),
      right: (response) => state = const SaveProfileState.data(),
    );
  }
}
