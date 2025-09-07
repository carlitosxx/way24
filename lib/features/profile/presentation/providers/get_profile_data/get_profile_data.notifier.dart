part of '../injects_container.provider.dart';

/// Clase
class GetProfileDataNotifier extends StateNotifier<GetProfileDataState> {
  /// Constructor
  GetProfileDataNotifier({
    required GetProfileDataUC getProfileDataUC,
    GetProfileDataState? initialState,
  })  : _getProfileDataUC = getProfileDataUC,
        super(initialState ?? const GetProfileDataState.initial());
  final GetProfileDataUC _getProfileDataUC;

  /// Resetea el estado a inicial
  void reset() => state = const GetProfileDataState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> getProfileData() async {
    state = const GetProfileDataState.loading();
    final result = await _getProfileDataUC();
    result.when(
      left: (error) =>
          state = GetProfileDataState.error(failureToString(error)),
      right: (response) => state = GetProfileDataState.data(
        profileEntity: response,
      ),
    );
  }
}
