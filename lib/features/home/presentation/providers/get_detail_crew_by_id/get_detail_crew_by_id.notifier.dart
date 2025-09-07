part of '../injects_container.provider.dart';

/// Clase
class GetDetailCrewByIdNotifier extends StateNotifier<GetDetailCrewByIdState> {
  /// Constructor
  GetDetailCrewByIdNotifier({
    required GetDetailCrewByIdUC getDetailCrewByIdUC,
    GetDetailCrewByIdState? initialState,
  })  : _getDetailCrewByIdUC = getDetailCrewByIdUC,
        super(initialState ?? const GetDetailCrewByIdState.initial());
  final GetDetailCrewByIdUC _getDetailCrewByIdUC;

  /// Resetea el estado a inicial
  void reset() => state = const GetDetailCrewByIdState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> getDetailCrewById(String id) async {
    state = const GetDetailCrewByIdState.loading();
    final result = await _getDetailCrewByIdUC(id: id);
    result.when(
      left: (error) =>
          state = GetDetailCrewByIdState.error(failureToString(error)),
      right: (response) => state = GetDetailCrewByIdState.data(
        crewDetailEntity: response,
      ),
    );
  }
}
