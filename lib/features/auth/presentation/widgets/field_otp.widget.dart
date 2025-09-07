// import 'package:delivery_pedidos/presentation/pages/auth/providers/otp.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/features/auth/presentation/providers/validations.provider.dart';

/// Widget textfield del codigo otp
class FieldOTPWidget extends ConsumerWidget {
  /// Constructor que recibe un index
  const FieldOTPWidget({required this.index, super.key});

  /// indice
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(numbersOTPProvider);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 40,
      width: 40,
      child: Center(
        child: (code.length >= index + 1)
            ? Text(
                code[index],
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              )
            : Text(
                '',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
      ),
    );
  }
}
