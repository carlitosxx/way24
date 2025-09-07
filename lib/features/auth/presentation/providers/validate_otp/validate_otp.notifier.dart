part of '../injects_container.provider.dart';

/// Clase
class ValidateOtpNotifier extends StateNotifier<ValidateOtpState> {
  /// Constructor
  ValidateOtpNotifier({
    required ValidateOtpUC validateOtpUC,
    ValidateOtpState? initialState,
  })  : _validateOtpUC = validateOtpUC,
        super(initialState ?? const ValidateOtpState.initial());
  final ValidateOtpUC _validateOtpUC;

  /// Resetea el estado a inicial
  void reset() => state = const ValidateOtpState.initial();

  /// funcion que no duelve nada y que solo transforma los estados
  Future<void> validateOtp(
    String email,
    String otpCode,
    String typeVerify,
  ) async {
    state = const ValidateOtpState.loading();
    final result = await _validateOtpUC(
      email: email,
      otpCode: otpCode,
      typeVerify: typeVerify,
    );
    result.when(
      left: (error) => state = ValidateOtpState.error(failureToString(error)),
      right: (response) => state = ValidateOtpState.data(
        data: response,
      ),
    );
  }
}
