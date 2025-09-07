part of '../injects_container.provider.dart';

/// Clase
class GetCategoriesNotifier extends StateNotifier<GetCategoriesState> {
  /// Constructor
  GetCategoriesNotifier({
    required GetCategoriesUC getCategoriesUC,
    GetCategoriesState? initialState,
  })  : _getCategoriesUC = getCategoriesUC,
        super(initialState ?? const GetCategoriesState.initial());
  final GetCategoriesUC _getCategoriesUC;

  /// Resetea el estado a inicial
  void reset() => state = const GetCategoriesState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> getCategories() async {
    state = const GetCategoriesState.loading();
    final result = await _getCategoriesUC();
    result.when(
      left: (error) => state = GetCategoriesState.error(failureToString(error)),
      right: (response) => state = GetCategoriesState.data(
        listCategories: response,
      ),
    );
  }
}
