import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shape_of_view/shape_of_view.dart';

class StarShape extends Shape {

  final int noOfPoints;

  StarShape({this.noOfPoints}) : assert(noOfPoints > 3);

  @override
  Path build({Rect rect, double scale}) {
    return generatePath(rect: rect);
  }

  Path generatePath({bool useBezier, Rect rect}) {
    final height = rect.height;
    final width = rect.width;

    final int vertices = noOfPoints * 2;
    final double alpha = (2 * pi) / vertices;
    final double radius = (height <= width? height : width) / 2.0;
    final double centerX = width / 2;
    final double centerY = height / 2;

    final Path path = Path();
    for (int i = vertices + 1; i != 0; i--) {
      final double r = radius * (i % 2 + 1) / 2;
      final double omega = alpha * i;
      path.lineTo((r * sin(omega)) + centerX, (r * cos(omega)) + centerY);
    }
    path.close();
    return path;
  }
}
