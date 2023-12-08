import 'package:flutter/material.dart';

import 'my_shape.dart';

class OXYPaint extends CustomPainter {
  final double zoom;
  final Offset offsetInit;
  final List<MyShape> shapes;

  OXYPaint(
    this.zoom,
    this.offsetInit,
    this.shapes,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // Draw oxy
    drawOXY(canvas, size);

    // Draw shapes
    for (var shape in shapes) {
      shape.draw(canvas, zoom, offsetInit);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawOXY(Canvas canvas, Size size) {
    final Paint axisPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    final Paint gridPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 0.5;

    const TextStyle textStyle = TextStyle(fontSize: 12, color: Colors.black);
    
    // Draw X-axis
    canvas.drawLine(
      Offset(0, size.height / 2 + offsetInit.dy),
      Offset(size.width, size.height / 2 + offsetInit.dy),
      axisPaint,
    );

    // Draw Y-axis
    canvas.drawLine(
      Offset(size.width / 2 + offsetInit.dx, 0),
      Offset(size.width / 2 + offsetInit.dx, size.height),
      axisPaint,
    );
 
    // Draw unit lines and labels on X-axis
    for (double i = size.width / 2 + offsetInit.dx;
        i < size.width;
        i += 50 / zoom) {
      canvas.drawLine(
        Offset(i, size.height / 2 - 5 + offsetInit.dy),
        Offset(i, size.height / 2 + 5 + offsetInit.dy),
        axisPaint,
      );

      drawText(
        (((i - size.width / 2 - offsetInit.dx) * zoom) / 25).toStringAsFixed(0),
        Offset(i - 5, size.height / 2 + 10 + offsetInit.dy),
        textStyle,
        canvas,
      );

      if (zoom <= 0.6) {
        canvas.drawLine(
          Offset(i - 50, size.height / 2 - 5 + offsetInit.dy),
          Offset(i - 50, size.height / 2 + 5 + offsetInit.dy),
          axisPaint,
        );
        canvas.drawLine(
          Offset(i, size.height / 2 - 5 + offsetInit.dy),
          Offset(i, size.height / 2 + 5 + offsetInit.dy),
          axisPaint,
        );
        drawText(
          (((i - 50 - size.width / 2 - offsetInit.dx) * zoom) / 25)
              .toStringAsFixed(0),
          Offset(i - 50 - 5, size.height / 2 + 10 + offsetInit.dy),
          textStyle,
          canvas,
        );
      }
    }

    for (double i = size.width / 2 + offsetInit.dx; i > 0; i -= 50 / zoom) {
      canvas.drawLine(
        Offset(i, size.height / 2 - 5 + offsetInit.dy),
        Offset(i, size.height / 2 + 5 + offsetInit.dy),
        axisPaint,
      );
      drawText(
        (((i - size.width / 2 - offsetInit.dx) * zoom) / 25).toStringAsFixed(0),
        Offset(i - 5, size.height / 2 + 10 + offsetInit.dy),
        textStyle,
        canvas,
      );
      if (zoom <= 0.6) {
        canvas.drawLine(
          Offset(i - 50, size.height / 2 - 5 + offsetInit.dy),
          Offset(i - 50, size.height / 2 + 5 + offsetInit.dy),
          axisPaint,
        );
        canvas.drawLine(
          Offset(i, size.height / 2 - 5 + offsetInit.dy),
          Offset(i, size.height / 2 + 5 + offsetInit.dy),
          axisPaint,
        );
        drawText(
          (((i - 50 - size.width / 2 - offsetInit.dx) * zoom) / 25)
              .toStringAsFixed(0),
          Offset(i - 50 - 5, size.height / 2 + 10 + offsetInit.dy),
          textStyle,
          canvas,
        );
      }
    }

    // Draw unit lines and labels on Y-axis
    for (double i = size.height / 2 + offsetInit.dy;
        i < size.height;
        i += 50 / zoom) {
      canvas.drawLine(
        Offset(size.width / 2 - 5 + offsetInit.dx, i),
        Offset(size.width / 2 + 5 + offsetInit.dx, i),
        axisPaint,
      );
      drawText(
        (((i - size.height / 2 - offsetInit.dy) * zoom) / -25)
            .toStringAsFixed(0),
        Offset(size.width / 2 - 25 + offsetInit.dx, i - 5),
        textStyle,
        canvas,
      );
      if (zoom <= 0.6) {
        canvas.drawLine(
          Offset(size.width / 2 - 5 + offsetInit.dx, i),
          Offset(size.width / 2 + 5 + offsetInit.dx, i),
          axisPaint,
        );
        canvas.drawLine(
          Offset(size.width / 2 - 5 + offsetInit.dx, i - 50),
          Offset(size.width / 2 + 5 + offsetInit.dx, i - 50),
          axisPaint,
        );
        drawText(
          (((i - 50 - size.height / 2 - offsetInit.dy) * zoom) / -25)
              .toStringAsFixed(0),
          Offset(size.width / 2 - 25 + offsetInit.dx, i - 50 - 5),
          textStyle,
          canvas,
        );
      }
    }

    for (double i = size.height / 2 + offsetInit.dy; i > 0; i -= 50 / zoom) {
      canvas.drawLine(
        Offset(size.width / 2 - 5 + offsetInit.dx, i),
        Offset(size.width / 2 + 5 + offsetInit.dx, i),
        axisPaint,
      );
      drawText(
        (((i - size.height / 2 - offsetInit.dy) * zoom) / -25)
            .toStringAsFixed(0),
        Offset(size.width / 2 - 25 + offsetInit.dx, i - 5),
        textStyle,
        canvas,
      );
      if (zoom <= 0.6) {
        canvas.drawLine(
          Offset(size.width / 2 - 5 + offsetInit.dx, i),
          Offset(size.width / 2 + 5 + offsetInit.dx, i),
          axisPaint,
        );
        canvas.drawLine(
          Offset(size.width / 2 - 5 + offsetInit.dx, i - 50),
          Offset(size.width / 2 + 5 + offsetInit.dx, i - 50),
          axisPaint,
        );
        drawText(
          (((i - 50 - size.height / 2 - offsetInit.dy) * zoom) / -25)
              .toStringAsFixed(0),
          Offset(size.width / 2 - 25 + offsetInit.dx, i - 50 - 5),
          textStyle,
          canvas,
        );
      }
    }

    // Draw grid lines
    for (double i = size.width / 2 + offsetInit.dx;
        i < size.width;
        i += 50 / zoom) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        gridPaint,
      );
    }

    for (double i = size.width / 2 + offsetInit.dx; i > 0; i -= 50 / zoom) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        gridPaint,
      );
    }

    for (double i = size.height / 2 + offsetInit.dy;
        i < size.height;
        i += 50 / zoom) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        gridPaint,
      );
    }

    for (double i = size.height / 2 + offsetInit.dy; i > 0; i -= 50 / zoom) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        gridPaint,
      );
    }
  }

  void drawText(String text, Offset offset, TextStyle style, Canvas canvas) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, offset);
  }
}



