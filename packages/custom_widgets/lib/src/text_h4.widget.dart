import 'package:flutter/material.dart';

/// Widget de texto cabecera v1
class TextH4 extends StatelessWidget {
  /// fontSize: 16, fontW500, textstyle: headLineSmall, color: onSurface
  const TextH4({
    required this.text,
    this.color,
    this.fontWeight,
    this.textAlign,
    super.key,
  });

  /// Propiedad texto
  final String text;

  /// Propiedad color
  final Color? color;

  /// Propiedad text align
  final TextAlign? textAlign;

  /// Propiedad negrita
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: 16,
          color: color ?? Theme.of(context).colorScheme.onSurface,
        );
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}
