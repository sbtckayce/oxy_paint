
import 'package:flutter/material.dart';

import 'circle_shape.dart';
import 'my_shape.dart';
import 'oxy_paint.dart';
import 'rectangle_shape.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double zoom = 1.0;
  Offset offsetInit = Offset.zero;
  List<MyShape> shapes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onScaleUpdate: (details) {
              if (details.scale > 0.5 && details.scale < 1.5) {
                setState(() {
                  zoom = details.scale;

                  offsetInit += details.focalPointDelta;
                });
              }
            },
            child: CustomPaint(
              painter: OXYPaint(zoom, offsetInit, shapes),
              child: Container(),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      shapes.add(Circle(
                          centerX: offsetInit.dx, centerY: offsetInit.dy));
                    });
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      shapes.add(Rectangle(
                          centerX: offsetInit.dx, centerY: offsetInit.dy));
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    setState(() {
                      shapes.clear();
                    });
                  },
                  child: const Text('Remove All'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  offsetInit.toString(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}