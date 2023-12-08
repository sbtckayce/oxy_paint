import 'dart:math';

import 'package:flutter/material.dart';

import 'my_shape.dart';

class Circle extends MyShape {
  final double radius = (Random().nextInt(30) + 20);
  final Color color = Color.fromRGBO(
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
    1.0,
  );

  Circle({required double centerX, required double centerY})
      : super(centerX: centerX, centerY: centerY);

  @override
  void draw(Canvas canvas, double zoom, Offset offsetInit) {
    final paint = Paint()..color = color;

    canvas.drawCircle(
        Offset(centerX * zoom + offsetInit.dx, centerY * zoom + offsetInit.dy),
        radius * zoom,
        paint);
  }
}
