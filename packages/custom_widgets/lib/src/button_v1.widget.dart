import 'package:flutter/material.dart';

/// Widget botton version 1
class ButtonV1 extends StatelessWidget {
  /// Constructor
  const ButtonV1({
    required this.text,
    required this.onPressed,
    this.fontWeight,
    this.fontSize,
    super.key,
  });

  /// Texto para el boton
  final String text;

  /// Nivel de negrita
  final FontWeight? fontWeight;

  /// Tamaño de letra
  final double? fontSize;

  /// Funcion para el evento click del boton
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize ?? 18,
          color: onPressed != null
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withValues(alpha: 0.4),
        ),
      ),
    );
  }
}
