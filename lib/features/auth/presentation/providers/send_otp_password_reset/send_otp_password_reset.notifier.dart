part of '../injects_container.provider.dart';

/// Clase send otp password reset notifier
class SendOtpPasswordResetNotifier
    extends StateNotifier<SendOtpPasswordResetState> {
  /// Constructor send otp password reset notifier
  SendOtpPasswordResetNotifier({
    required SendOtpPasswordResetUC sendOtpPasswordResetUC,
    SendOtpPasswordResetState? initialState,
  })  : _sendOtpPasswordResetUC = sendOtpPasswordResetUC,
        super(initialState ?? const SendOtpPasswordResetState.initial());
  final SendOtpPasswordResetUC _sendOtpPasswordResetUC;

  /// Resetea el estado a inicial
  void reset() => state = const SendOtpPasswordResetState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> sendOtpPasswordReset(
    String email,
  ) async {
    state = const SendOtpPasswordResetState.loading();
    final result = await _sendOtpPasswordResetUC(email: email);
    result.when(
      left: (error) =>
          state = SendOtpPasswordResetState.error(failureToString(error)),
      right: (_) => state = const SendOtpPasswordResetState.data(),
    );
  }
}
