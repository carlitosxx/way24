part of '../injects_container.provider.dart';

/// Clase
class GetTouristPackagesNotifier
    extends StateNotifier<GetTouristPackagesState> {
  /// Constructor
  GetTouristPackagesNotifier({
    required GetTouristPackagesUC getTouristPackagesUC,
    GetTouristPackagesState? initialState,
  })  : _getTouristPackagesUC = getTouristPackagesUC,
        super(initialState ?? const GetTouristPackagesState.initial());
  final GetTouristPackagesUC _getTouristPackagesUC;

  /// Resetea el estado a inicial
  void reset() => state = const GetTouristPackagesState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> getTouristPackages(
    String userId,
  ) async {
    state = const GetTouristPackagesState.loading();
    final result = await _getTouristPackagesUC(userId: userId);
    result.when(
      left: (error) =>
          state = GetTouristPackagesState.error(failureToString(error)),
      right: (response) => state = GetTouristPackagesState.data(
        listTouristPackages: response,
      ),
    );
  }
}
