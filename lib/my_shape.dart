import 'package:flutter/material.dart';

abstract class MyShape {
  double centerX;
  double centerY;

  MyShape({required this.centerX, required this.centerY});

  void draw(Canvas canvas, double zoom, Offset offsetInit);
}