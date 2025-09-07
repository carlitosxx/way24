part of '../injects_container.provider.dart';

/// Clase
class GetCrewsNotifier extends StateNotifier<GetCrewsState> {
  /// Constructor
  GetCrewsNotifier({
    required GetCrewsUC getCrewsUC,
    GetCrewsState? initialState,
  })  : _getCrewsUC = getCrewsUC,
        super(initialState ?? const GetCrewsState.initial());
  final GetCrewsUC _getCrewsUC;

  /// Resetea el estado a inicial
  void reset() => state = const GetCrewsState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> getCrews() async {
    state = const GetCrewsState.loading();
    final result = await _getCrewsUC();
    result.when(
      left: (error) => state = GetCrewsState.error(failureToString(error)),
      right: (response) => state = GetCrewsState.data(
        listCrews: response,
      ),
    );
  }
}
