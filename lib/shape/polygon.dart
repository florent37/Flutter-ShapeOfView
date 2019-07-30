import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

class PolygonShape extends Shape {
  final int numberOfSides;

  PolygonShape({this.numberOfSides = 5}) : assert(numberOfSides >= 3);

  @override
  Path build({Rect rect, double scale}) {
    return generatePath(rect: rect);
  }

  Path generatePath({bool useBezier, Rect rect}) {
    final height = rect.height;
    final width = rect.width;

    final double section = (2.0 * pi / numberOfSides);
    final double polygonSize = min(width, height);
    final double radius = polygonSize / 2;
    final double centerX = width / 2;
    final double centerY = height / 2;

    final Path polygonPath = new Path();
    polygonPath.moveTo((centerX + radius * cos(0)), (centerY + radius * sin(0)));

    for (int i = 1; i < numberOfSides; i++) {
      polygonPath.lineTo((centerX + radius * cos(section * i)), (centerY + radius * sin(section * i)));
    }

    polygonPath.close();
    return polygonPath;
  }
}
