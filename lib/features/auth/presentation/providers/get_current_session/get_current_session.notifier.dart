part of '../injects_container.provider.dart';

/// Class that manages the state for getting the current session.
class GetCurrentSessionNotifier extends StateNotifier<GetCurrentSessionState> {
  /// Initializes the notifier with the given `GetCurrentSessionUC` use case and
  /// an optional initial state. If no initial state is provided, it defaults to
  /// `GetCurrentSessionState.initial()`.
  GetCurrentSessionNotifier({
    required GetCurrentSessionUC getCurrentSessionUC,
    GetCurrentSessionState? initialState,
  })  : _getCurrentSessionUC = getCurrentSessionUC,
        super(initialState ?? const GetCurrentSessionState.initial());
  final GetCurrentSessionUC _getCurrentSessionUC;

  /// Resets the state to the initial state.
  void reset() => state = const GetCurrentSessionState.initial();

  /// Fetches the current session and updates the state accordingly.
  ///
  /// Sets the state to `GetCurrentSessionState.loading()` while the session is
  /// being retrieved. Once the session is fetched, it updates the state based
  /// on the result:
  /// - If there is an error, the state is set to
  /// `GetCurrentSessionState.error()` with the error description.
  /// - If the session data is successfully retrieved, the state is set to
  ///   `GetCurrentSessionState.data()` with the user entity.
  Future<void> getCurrentSession() async {
    state = const GetCurrentSessionState.loading();
    final result = await _getCurrentSessionUC();
    result.when(
      left: (error) =>
          state = GetCurrentSessionState.error(failureToString(error)),
      right: (userEntity) => state = GetCurrentSessionState.data(
        userEntity: userEntity,
      ),
    );
  }
}
