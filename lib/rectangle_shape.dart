import 'dart:math';

import '/my_shape.dart';
import 'package:flutter/widgets.dart';

class Rectangle extends MyShape {
  double width = 40;
  double height = 40;
  final Color color = Color.fromRGBO(
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
    1.0,
  );

  Rectangle({required double centerX, required double centerY})
      : super(centerX: centerX, centerY: centerY);

  @override
  void draw(Canvas canvas, double zoom, Offset offsetInit) {
    final paint = Paint()..color = color;
    canvas.drawRect(
      Rect.fromCenter(
          center: Offset(
              centerX * zoom + offsetInit.dx, centerY * zoom + offsetInit.dy),
          width: width,
          height: height),
      paint,
    );
  }
}
