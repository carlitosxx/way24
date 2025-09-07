import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/features/auth/presentation/providers/validations.provider.dart';

/// Widget del teclado numerico para el codigo otp
class ButtonNumericWidget extends ConsumerWidget {
  ///Constructor que recibe el numero
  const ButtonNumericWidget({required this.number, super.key});

  /// Numero del teclado numerico
  final int number;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codes = ref.watch(numbersOTPProvider);
    return TextButton(
      onPressed: () {
        if (codes.length != 6) {
          ref.read(numbersOTPProvider.notifier).update((state) {
            final newString = '$state$number';
            return newString;
          });
        }
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        '$number',
        style: TextStyle(
          fontSize: 24,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
