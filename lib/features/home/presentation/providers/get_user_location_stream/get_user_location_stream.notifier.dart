part of '../injects_container.provider.dart';

/// Clase
class GetUserLocationStreamNotifier
    extends StateNotifier<GetUserLocationStreamState> {
  /// Constructor
  GetUserLocationStreamNotifier({
    required GetUserLocationStreamUC getUserLocationStreamUC,
    GetUserLocationStreamState? initialState,
  })  : _getUserLocationStreamUC = getUserLocationStreamUC,
        super(initialState ?? const GetUserLocationStreamState.initial());
  final GetUserLocationStreamUC _getUserLocationStreamUC;

  /// Resetea el estado a inicial
  void reset() => const GetUserLocationStreamState.initial();
  StreamSubscription<Either<HttpFailure, LatLng>>? _subscription;

  /// funcion que no duelve nada y que solo transforma los estados
  void getUserLocationStream(
    String userId,
  ) {
    state = const GetUserLocationStreamState.loading();

    _subscription = _getUserLocationStreamUC(userId: userId).listen(
      (result) {
        result.when(
          left: (error) {
            state = GetUserLocationStreamState.error(
              failureToString(error),
            );
          },
          right: (latLng) {
            state = GetUserLocationStreamState.data(latlng: latLng);
          },
        );
      },
      onError: (error) {
        state = GetUserLocationStreamState.error(
          failureToString(HttpFailure.local()),
        );
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
