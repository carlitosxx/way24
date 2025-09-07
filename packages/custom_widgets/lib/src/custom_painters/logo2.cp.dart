import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';

/// Logo con imagen de fondo
class LogoCP2 extends CustomPainter {
  /// Constructor con imagen
  LogoCP2({required this.image});

  /// Imagen a usar como textura de fondo
  final ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    void drawPathWithImage(Path path) {
      // Guardamos el estado del canvas
      canvas
        ..save()
        // Recortamos el área con la forma
        ..clipPath(path);
      // Dibujamos la imagen ajustando su tamaño al área del logo
      final src =
          Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble());
      final dst = Rect.fromLTWH(0, 0, size.width, size.height);
      canvas
        ..drawImageRect(image, src, dst, paint)
        // Restauramos el canvas
        ..restore();
    }

    // Definir los 4 paths de las formas
    final path0 = Path()
      ..moveTo(size.width * 0.6437500, 0)
      ..lineTo(size.width * 0.7437500, 0)
      ..cubicTo(
        size.width * 0.8854167,
        0,
        size.width,
        size.height * 0.1341463,
        size.width,
        size.height * 0.2975610,
      )
      ..lineTo(size.width, size.height * 0.2975610)
      ..cubicTo(
        size.width,
        size.height * 0.3609756,
        size.width * 0.9562500,
        size.height * 0.4146341,
        size.width * 0.9000000,
        size.height * 0.4146341,
      )
      ..lineTo(size.width * 0.6437500, size.height * 0.4146341)
      ..cubicTo(
        size.width * 0.5895833,
        size.height * 0.4146341,
        size.width * 0.5437500,
        size.height * 0.3634146,
        size.width * 0.5437500,
        size.height * 0.2975610,
      )
      ..lineTo(size.width * 0.5437500, size.height * 0.1170732)
      ..cubicTo(
        size.width * 0.5458333,
        size.height * 0.05121951,
        size.width * 0.5895833,
        0,
        size.width * 0.6437500,
        0,
      )
      ..close();

    final path1 = Path()
      ..moveTo(size.width * 0.3562500, size.height * 0.4146341)
      ..lineTo(size.width * 0.1000000, size.height * 0.4146341)
      ..cubicTo(
        size.width * 0.04375000,
        size.height * 0.4146341,
        0,
        size.height * 0.3634146,
        0,
        size.height * 0.2975610,
      )
      ..lineTo(0, size.height * 0.2975610)
      ..cubicTo(
        0,
        size.height * 0.1341463,
        size.width * 0.1145833,
        0,
        size.width * 0.2541667,
        0,
      )
      ..lineTo(size.width * 0.3541667, 0)
      ..cubicTo(
        size.width * 0.4083333,
        0,
        size.width * 0.4541667,
        size.height * 0.05121951,
        size.width * 0.4541667,
        size.height * 0.1170732,
      )
      ..lineTo(size.width * 0.4541667, size.height * 0.3000000)
      ..cubicTo(
        size.width * 0.4541667,
        size.height * 0.3634146,
        size.width * 0.4104167,
        size.height * 0.4146341,
        size.width * 0.3562500,
        size.height * 0.4146341,
      )
      ..close();

    final path2 = Path()
      ..moveTo(size.width * 0.8958333, size.height * 0.6292683)
      ..lineTo(size.width * 0.8958333, size.height * 0.7024390)
      ..cubicTo(
        size.width * 0.8958333,
        size.height * 0.8658537,
        size.width * 0.7812500,
        size.height,
        size.width * 0.6416667,
        size.height,
      )
      ..lineTo(size.width * 0.6416667, size.height)
      ..cubicTo(
        size.width * 0.5875000,
        size.height,
        size.width * 0.5416667,
        size.height * 0.9487805,
        size.width * 0.5416667,
        size.height * 0.8829268,
      )
      ..lineTo(size.width * 0.5416667, size.height * 0.6292683)
      ..cubicTo(
        size.width * 0.5416667,
        size.height * 0.5658537,
        size.width * 0.5854167,
        size.height * 0.5121951,
        size.width * 0.6416667,
        size.height * 0.5121951,
      )
      ..lineTo(size.width * 0.7979167, size.height * 0.5121951)
      ..cubicTo(
        size.width * 0.8520833,
        size.height * 0.5121951,
        size.width * 0.8958333,
        size.height * 0.5634146,
        size.width * 0.8958333,
        size.height * 0.6292683,
      )
      ..close();

    final path3 = Path()
      ..moveTo(size.width * 0.4583333, size.height * 0.6292683)
      ..lineTo(size.width * 0.4583333, size.height * 0.8853659)
      ..cubicTo(
        size.width * 0.4583333,
        size.height * 0.9487805,
        size.width * 0.4145833,
        size.height * 1.002439,
        size.width * 0.3583333,
        size.height * 1.002439,
      )
      ..lineTo(size.width * 0.3583333, size.height * 1.002439)
      ..cubicTo(
        size.width * 0.2187500,
        size.height,
        size.width * 0.1041667,
        size.height * 0.8658537,
        size.width * 0.1041667,
        size.height * 0.7024390,
      )
      ..lineTo(size.width * 0.1041667, size.height * 0.6292683)
      ..cubicTo(
        size.width * 0.1041667,
        size.height * 0.5634146,
        size.width * 0.1479167,
        size.height * 0.5121951,
        size.width * 0.2041667,
        size.height * 0.5121951,
      )
      ..lineTo(size.width * 0.3604167, size.height * 0.5121951)
      ..cubicTo(
        size.width * 0.4145833,
        size.height * 0.5121951,
        size.width * 0.4583333,
        size.height * 0.5634146,
        size.width * 0.4583333,
        size.height * 0.6292683,
      )
      ..close();

    // Dibujar la imagen dentro de cada path
    drawPathWithImage(path0);
    drawPathWithImage(path1);
    drawPathWithImage(path2);
    drawPathWithImage(path3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
