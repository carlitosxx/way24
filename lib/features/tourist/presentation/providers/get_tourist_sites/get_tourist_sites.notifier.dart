part of '../injects_container.provider.dart';

/// Clase
class GetTouristSitesNotifier extends StateNotifier<GetTouristSitesState> {
  /// Constructor
  GetTouristSitesNotifier({
    required GetTouristSitesUC getTouristSitesUC,
    GetTouristSitesState? initialState,
  })  : _getTouristSitesUC = getTouristSitesUC,
        super(initialState ?? const GetTouristSitesState.initial());
  final GetTouristSitesUC _getTouristSitesUC;

  /// Resetea el estado a inicial
  void reset() => state = const GetTouristSitesState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> getTouristSistes(String packageId) async {
    state = const GetTouristSitesState.loading();
    final result = await _getTouristSitesUC(
      packageId: packageId,
    );
    result.when(
      left: (error) =>
          state = GetTouristSitesState.error(failureToString(error)),
      right: (response) => state = GetTouristSitesState.data(
        listTouristSite: response,
      ),
    );
  }
}
