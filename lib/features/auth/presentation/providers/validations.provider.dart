import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider para registrar el numero OTP
final numbersOTPProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

/// Provider para activar el boton de reenviar
final enableButtonResendProvider = StateProvider<bool>(
  (ref) {
    final countDownState =
        ref.watch(countDownControllerProvider(const Duration(seconds: 60)));
    if (countDownState.inSeconds == 0) {
      return true;
    } else {
      return false;
    }
  },
);

/// Provider para el contador hacia atras
final countDownControllerProvider =
    StateNotifierProvider.family<CountdownController, Duration, Duration>(
        (ref, initialDuration) {
  return CountdownController(initialDuration);
});

/// StateNotifier
class CountdownController extends StateNotifier<Duration> {
  /// Constructor
  CountdownController(this.initialDuration) : super(initialDuration) {
    startTimer();
  }

  /// tiempo
  Timer? timer;

  /// Duracion inicial
  final Duration initialDuration;

  /// Funcion que empieza el temporizador
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state == Duration.zero) {
        timer.cancel();
      } else {
        if (mounted) {
          state = state - const Duration(seconds: 1);
        } else {
          timer.cancel();
        }
      }
    });
  }

  /// Funcion para detener el temporizador
  void stopTimer() {
    timer?.cancel();
  }

  /// Funcion para resetear el temporizador
  void resetTimer({required Duration initialDuration}) {
    stopTimer();
    state = initialDuration;
    startTimer();
  }

  /// Agregar duracion
  void addTime({required Duration duration}) {
    state = state + duration;
  }

  /// Quitar duracion
  void subtractTime({required Duration duration}) {
    state = state - duration;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}

/// Provider checkbox acepto terminos y condiciones
final hasAcceptedTermsProvider =
    StateProvider.autoDispose<bool>((ref) => false);

/// Provider date of birth picker
final dateOfBirthProvider = StateProvider.autoDispose<DateTime?>(
  (ref) {
    return null;
  },
);
